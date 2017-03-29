#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo sh init.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "추가 확장 설정을 시작하도록 하겠습니다.\n"

apt -y install node
apt -y install npm
npm install -g node-red
npm install -g node-grovepi
npm install -g node-red-grovepi-nodes
npm install -g node-red-contrib-azure-iot-hub
sleep 2s
pip install python-twitter

reboot
