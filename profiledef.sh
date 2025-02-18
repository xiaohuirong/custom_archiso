#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archlinux"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Arch Linux <https://archlinux.org>"
iso_application="Arch Linux Live/Rescue CD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
# airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
airootfs_image_tool_options=('-comp' 'zstd')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
  ["/etc/sudoers"]="0:0:0400"
  ["/etc/skel/.config/tigervnc/passwd"]="0:0:600"
  ["/etc/skel/.config/eww/dashboard/launch_dashboard"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/change_resolution.sh"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/control_light.sh"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/cover_get"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/mails"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/music_info"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/open_apps"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/open_links"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/power"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/sys_info"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/upgrade_pkgs"]="0:0:755"
  ["/etc/skel/.config/eww/dashboard/scripts/weather_info"]="0:0:755"
  ["/etc/skel/.config/rofi/launcher"]="0:0:755"
  ["/etc/skel/.local/bin/toggle_theme.sh"]="0:0:755"
  ["/etc/skel/.local/bin/screen-cast.sh"]="0:0:755"
  ["/etc/skel/.local/bin/screen-keyboard.sh"]="0:0:755"
  ["/etc/skel/.local/bin/screen-shot.sh"]="0:0:755"
  ["/etc/skel/.local/bin/waybar-wlsun-set.sh"]="0:0:755"
  ["/etc/skel/.local/bin/cliphist-rofi-img"]="0:0:755"
  ["/etc/skel/.local/bin/wob.sh"]="0:0:755"
  ["/etc/skel/.local/bin/light.sh"]="0:0:755"
  ["/etc/skel/.local/bin/audio.sh"]="0:0:755"
  ["/etc/skel/.config/emptty"]="0:0:755"
)
