#!/bin/sh

# Check if it has root permission
if [[ "$UID" -ne "$ROOT_UID" ]] ; then
	printf "죄송합니다! 관리자 권한으로 실행하여 주세요. 화면에 \"sudo 02_make_read_message.sh\" 이라고 입력합니다.\n"
	exit 1
fi

printf "잘했습니다! 이제 장치-클라우드간 메시지를 받기 위한 설정을 시작하겠습니다.\n"
printf "이번에는 세가지 항목을 입력합니다.\n"

read -r -p "Azure Portal에서 이벤트 허브 호환 끝점을 입력하세요. (IoTHub -> 메시징 -> 끝점 -> 기본 제공 끝점 -> 이름 -> Events -> 이벤트 허브 호환 끝점) : " USER_Endpoint
echo $USER_Endpoint
read -r -p "Azure Portal에서 이벤트 허브 호환 이름을 입력하세요. (IoTHub -> 메시징 -> 끝점 -> 기본 제공 끝점 -> 이름 -> Events -> 이벤트 허브 호환 이름) : " USER_EntityPath
echo $USER_EntityPath
read -r -p "Azure Portal에서 기본 키를 입력하세요. (IoTHub -> 설정 -> 공유 액세스 정책 -> 정책 -> iothubowner -> 공유 액세스 키 -> 기본 키) : " USER_SharedAccessKey
echo $USER_SharedAccessKey

# Insert Endpoint, EntityPath, and SharedAccessKey to read-d2c-messages
sed -i "s~{Endpoint}~$USER_Endpoint~g" ./read-d2c-messages/src/main/java/com/mycompany/app/App.java
sed -i "s~{EntityPath}~$USER_EntityPath~g" ./read-d2c-messages/src/main/java/com/mycompany/app/App.java
sed -i "s~{SharedAccessKey}~$USER_SharedAccessKey~g" ./read-d2c-messages/src/main/java/com/mycompany/app/App.java

mvn clean package -DskipTests -f ./read-d2c-messages

printf "장치-클라우드간 메시지를 받기 위한 설정을 완료하였습니다!\n"
sleep 20s
