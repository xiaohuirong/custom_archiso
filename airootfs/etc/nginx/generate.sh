#!/bin/bash

mkdir -p /etc/nginx/ssl

# 生成私钥 (2048-bit RSA)
openssl genpkey -algorithm RSA -out /etc/nginx/ssl/selfsigned.key

# 生成自签名证书，有效期 3650 天
openssl req -new -x509 -key /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt -days 3650

openssl dhparam -out /etc/nginx/dhparam.pem 2048
chmod 644 /etc/nginx/dhparam.pem
