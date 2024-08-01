# 代理相关begin
proxy_host=arch.hoream.top
http_global_port=8889
https_global_port=$http_global_port
socks_global_port=1089

http_gfw_port=20172
https_gfw_port=$http_gfw_port
socks_gfw_port=20171

# host=192.168.9.1
# yay proxy
# alias yay="/usr/bin/env HTTPS_PROXY=http://$proxy_host:$http_gfw_port yay"

function ter-gfw(){
    export no_proxy="localhost,127.0.0.1,hoream.top,.hoream.top,router.top"
    local proxy="http://$proxy_host:$http_gfw_port"
    export http_proxy=$proxy \
           https_proxy=$proxy \
           ftp_proxy=$proxy \
           rsync_proxy=$proxy \
           HTTP_PROXY=$proxy \
           HTTPS_PROXY=$proxy \
           FTP_PROXY=$proxy \
           RSYNC_PROXY=$proxy
	echo -e "GFW-Mode terminal proxy set."
}

function ter-global(){
    export no_proxy="localhost,127.0.0.1,hoream.top,.hoream.top,router.top"
    local proxy="http://$proxy_host:$http_global_port"
    export http_proxy=$proxy \
           https_proxy=$proxy \
           ftp_proxy=$proxy \
           rsync_proxy=$proxy \
           HTTP_PROXY=$proxy \
           HTTPS_PROXY=$proxy \
           FTP_PROXY=$proxy \
           RSYNC_PROXY=$proxy
	echo -e "Global terminal proxy set."
}

function ter-off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}

function ter-show(){
    echo "http_proxy  = $http_proxy\nhttps_proxy = $https_proxy\nftp_proxy   = $ftp_proxy\nrsync_proxy = $rsync_proxy\nHTTP_PROXY  = $HTTP_PROXY\nHTTPS_PROXY = $HTTPS_PROXY\nFTP_PROXY   = $FTP_PROXY\nRSYNC_PROXY = $RSYNC_PROXY"
    curl https://ipinfo.io
}

function sys-auto(){
    gsettings set org.gnome.system.proxy autoconfig-url 'file:///usr/share/v2ray/gfwlist.pac'
    gsettings set org.gnome.system.proxy mode auto
}

function sys-gfw(){
    gsettings set org.gnome.system.proxy.http host $proxy_host
    gsettings set org.gnome.system.proxy.http port $http_gfw_port

    gsettings set org.gnome.system.proxy.https host $proxy_host
    gsettings set org.gnome.system.proxy.https port $https_gfw_port

    gsettings set org.gnome.system.proxy.socks host $proxy_host
    gsettings set org.gnome.system.proxy.socks port $socks_gfw_port
    gsettings set org.gnome.system.proxy mode manual
}

function sys-global(){
    gsettings set org.gnome.system.proxy.http host $proxy_host
    gsettings set org.gnome.system.proxy.http port $http_global_port

    gsettings set org.gnome.system.proxy.https host $proxy_host
    gsettings set org.gnome.system.proxy.https port $https_global_port
    
    gsettings set org.gnome.system.proxy.socks host $proxy_host
    gsettings set org.gnome.system.proxy.socks port $socks_global_port
    gsettings set org.gnome.system.proxy mode manual
}

function sys-off(){
    gsettings set org.gnome.system.proxy mode none
}

function sys-show(){
    local mode=$(gsettings get org.gnome.system.proxy mode | sed "s/^'\(.*\)'$/\1/")
    if [ $mode = "none" ];then
        echo "No system proxy is set"
    elif [ $mode = "auto" ];then
        echo "mode: $mode"
        local pac_path=$(gsettings get org.gnome.system.proxy autoconfig-url | sed "s/^'\(.*\)'$/\1/")
        echo "pac : $pac_path" 
    else
        local addr=$(gsettings get org.gnome.system.proxy.http host | sed "s/^'\(.*\)'$/\1/")
        local port=$(gsettings get org.gnome.system.proxy.http port | sed "s/^'\(.*\)'$/\1/")
        if [ $port = $http_gfw_port ]; then
            echo "mode : gfw"
        else
            echo "mode : global"
        fi
        echo "http : $addr:$port"
        local addr=$(gsettings get org.gnome.system.proxy.https host | sed "s/^'\(.*\)'$/\1/")
        local port=$(gsettings get org.gnome.system.proxy.https port | sed "s/^'\(.*\)'$/\1/")
        echo "https: $addr:$port"
        local addr=$(gsettings get org.gnome.system.proxy.socks host | sed "s/^'\(.*\)'$/\1/")
        local port=$(gsettings get org.gnome.system.proxy.socks port | sed "s/^'\(.*\)'$/\1/")
        echo "socks: $addr:$port"
    fi
}

# 代理相关结束
