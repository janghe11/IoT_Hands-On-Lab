## 내 Raspberry Pi의 IP 알아내기
Raspberry Pi는 콘솔로 연결하여 사용하기보다, 원격으로 접속하여 사용하는 경우가 많습니다.
### 예제를 통한 실행
* `cd ~/iot-raspbian`을 입력하여 iot-raspbian 폴더로 이동합니다.
#### Lan 케이블을 통하여 Raspberry Pi와 공유기를 연결하였을 경우
1. `sudo python 01_ip-check-eth0.py`를 입력합니다.
2. LCD 화면에 나타나는 IP 주소를 확인합니다.
3. IP 주소를 메모장에 복사하여 기록합니다.
#### WiFi를 통하여 Raspberry Pi와 공유기를 연결하였을 경우
1. `sudo python 01_ip-check-wlan0.py`를 입력합니다.
2. LCD 화면에 나타나는 IP 주소를 확인합니다.
3. IP 주소를 메모장에 복사하여 기록합니다.
### 명령어를 통한 실행
* `ifconfig` 명령어를 실행합니다.
  * Lan 케이블(유선) 연결 -> eth0 / WiFi 연결 -> wlan0 IP확인

* `exit` 명령어를 통하여 접속을 종료합니다.

## Filezilla로 파일 송수신하기
![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/006_Filezilla_001.png)
Raspberry Pi에 있는 파일을 다운로드 하거나 업로드 할 경우, Filezilla를 통해 접속하여 전송할 수 있습니다.<br />
단, 접속한 유저와 해당 폴더의 권한이 다를 경우, 접근이 허용되지 않습니다.

## 초기 설정하기
* `sudo raspi-config`를 입력합니다.
![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/006_raspi-config_001.png)
* **Expand File System**을 키보드로 선택하고 Tab키를 눌러 <Select> 항목으로 이동 후 Enter로 실행합니다.
![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/006_raspi-config_002.png)
* **Root partition has benn resized** 문구가 나오면 OK 항목 선택 후 메인 화면으로 나와 <Finish> 항목을 선택합니다.
* `cd iot-raspbian`으로 이동한 다음 `sudo sh init.sh`를 실행합니다.
