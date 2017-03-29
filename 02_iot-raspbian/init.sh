#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo sh init.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "환영합니다! 처음 설정을 시작하도록 하겠습니다.\n"

sed -i "s/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g" /boot/config.txt

locale-gen ko_KR.UTF-8
apt update
apt -y install vim
apt -y install node
apt -y install npm
apt -y install python-dev
apt -y install python-pip

reboot
