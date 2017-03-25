#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo sh init.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "환영합니다! 처음 설정을 시작하도록 하겠습니다.\n"
locale-gen ko_KR.UTF-8
git clone https://github.com/DexterInd/GrovePi.git
apt update
apt -y install vim
apt -y install node
apt -y install npm
apt -y install python-dev
apt -y install python-pip

sed -i "s/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/g" /boot/config.txt

npm install -g node-red
npm install -g node-grovepi
npm install -g node-red-grovepi-nodes
npm install -g node-red-contrib-azure-iot-hub
sleep 2s
pip install python-twitter

reboot

#Mac OS SD 테스트

#az iot device create --device-id grovepi --hub-name TaeheeIoTHub --resource-group Taehee_IoT-Test
