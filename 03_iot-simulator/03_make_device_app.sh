#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo 03_make_device_app.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "마지막 설정입니다. 이제 가상의 시뮬레이션 앱을 만들어 보도록 하겠습니다.(풍속 / 온도 / 습도 / 먼지농도)"
printf "처음 가상의 장치를 만들때 생성하였던 Key와 호스트 이름을 입력합니다.\n"

read -r -p "호스트 이름을 입력하세요. (IoTHub -> 개요 -> 호스트 이름 -> 호스트이름.azure-devices.net / .azure-devices.net은 복사하지 마세요!) : " USER_Hostname
echo $USER_Hostname
read -r -p "메모장에 복사하였던 장치 Key를 입력하세요. : " USER_VirtualDeviceKey
echo $USER_VirtualDeviceKey

sed -i "s~{youriothubname}~$USER_Hostname~g" ./simulated-device/src/main/java/com/mycompany/app/App.java
sed -i "s~{yourdevicekey}~$USER_VirtualDeviceKey~g" ./simulated-device/src/main/java/com/mycompany/app/App.java

mvn clean package -DskipTests -f ./simulated-device

printf "잘했습니다! 시뮬레이션 앱을 만들었습니다.\n"
printf "지금까지의 모든 창과 인터넷 창은 종료하여 주십시오.\n"
sleep 10s
