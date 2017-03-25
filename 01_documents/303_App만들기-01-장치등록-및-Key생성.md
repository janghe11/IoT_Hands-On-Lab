# IoT Hub 생성 및 설정하기

   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/303_DeviceID_001.png)
1. 생성한 IoT Hub를 클릭한 뒤 설정 -> 공유 액세스 정책 -> iothubowner -> 공유 액세스 키 에서 연결문자열-기본키 값을 복사합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/303_DeviceID_002.png)
2. 바탕화면의 iot-simulator 폴더에서 01_make_device_id.sh를 실행합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/303_DeviceID_003.png)
3. 복사한 연결문자열-기본키를 붙여넣기 하고 엔터를 입력합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/303_DeviceID_004.png)
4. IoT Hub에 가상의 장치 이름 myFirstDevice를 생성하여 Key 값을 부여받았습니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/303_DeviceID_005.png)
5. IoT Hub의 DeviceExplorer에 myFirstDevice로 장치가 생성된 것을 보실 수 있습니다.
