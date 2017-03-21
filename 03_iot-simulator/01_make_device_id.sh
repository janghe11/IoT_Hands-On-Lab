#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo 01_make_device_id.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "가상의 장치를 만들도록 하겠습니다.\n"
read -r -p "연결 문자열-기본키를 입력하세요. (IoTHub -> 설정 -> 공유 액세스 정책 -> iothubowner -> 공유 액세스 키 -> 연결 문자열-기본 키) : " USER_connectionString
echo $USER_connectionString

# Insert connectionString to create-device-identity
sed -i "s~{yourhubconnectionstring}~$USER_connectionString~g" ./create-device-identity/src/main/java/com/mycompany/app/App.java

mvn clean package -DskipTests -f ./create-device-identity
mvn exec:java -Dexec.mainClass="com.mycompany.app.App" -f ./create-device-identity

printf "가상의 장치 정보를 생성하였습니다! 장치 Key값을 메모장에 복사합니다.\n"
printf "이 창은 10분 뒤에 자동으로 닫힙니다. 10분 안에 복사를 완료하십시오.\n"
printf "이 창은 Ctrl + C를 눌러 종료할 수 있습니다."
sleep 10m
