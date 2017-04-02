# Raspberry Pi로 SSH를 통하여 접속하기
Raspberry Pi를 사용하기 위해서는 크게 SSH를 통한 접속과 HDMI, Keyboard, Mouse를 통한 콘솔 직접 접속이 있습니다.<br />
여기에서는 원격으로 접속하여 제어할 수 있는 SSH 접속에 대하여 설명합니다.

## 내 라즈베리파이 IP 알아내기
라즈베리파이에 접속하기 위해서는 WiFi를 통한 SSH 접속이 이루어져야 합니다. <br />
공유기에서는 라즈베리파이에 IP를 알아서 할당(DHCP)하기 때문에, 공유기에 접속해서 해당 IP를 알아내야 합니다.<br />
여기서는 가장 많이 사용되는 ipTIME 공유기를 기준으로 설명합니다.
1. 현재 접속된 PC에 연결되어있는 공유기 Gateway IP로 접속합니다. (예 : 192.168.0.1)
2. 좌측 메뉴탐색기에서 고급설정 -> 내부 네트워크 설정으로 들어갑니다.
3. 가운데 장치 이름에 "raspberry"라고 되어있는 장치를 찾습니다.
4. 좌측에 raspberry 장치에 할당되어있는 IP 주소를 확인합니다.
![Get Mac Address and IP](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_MACIP.png)

## SSH로 접속하기 위한 환경 구성
Mac OS나 Linux의 경우 SSH 접속 프로그램이 대부분 설치되어 있습니다. Windows의 경우 접속을 위한 프로그램을 설치하여야 합니다.

### Windows 10 64bit - Bash on Ubuntu on Windows
본 과정은 Windows 10 64bit(Home, Pro)에서 Linux의 기능을 사용할 수 있도록 활성화하는 방법을 안내합니다.<br />
cygwin과 같은 Linux binary 프로그램을 Windows용으로 따로 porting 할 필요 없이 native 프로그램을 그대로 사용할 수 있습니다.
1. 시작 -> 검색 -> 제어판 -> 프로그램 및 기능을 실행합니다.
2. 좌측 상단에서 Windows 기능 켜기/끄기를 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_BashonUbuntuonWindows_001.png)
3. Linux용 Windows 하위 시스템(베타)을 선택합니다.
4. 확인을 눌러 설치를 시작합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_BashonUbuntuonWindows_002.png)
5. Windows를 다시 시작 합니다.
6. 시작 -> 검색 -> 명령 프롬프트를 실행합니다.
7. 명령어창에 **'bash'** 라고 입력합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_BashonUbuntuonWindows_003.png)
8. 설치 여부를 묻는 물음에 **'y'**를 입력합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_BashonUbuntuonWindows_004.png)
9. 사용자 이름을 원하는 이름으로 설정합니다.
10. 사용자의 원하는 비밀번호를 설정합니다.

### Windows 10 32bit 및 8 이하 버전
Bash on Ubuntu on Windows 외에 접속할 수 있는 프로그램은 putty, xshell, cygwin등 여러가지 방법이 있습니다.<br />
여기에서는 대표적인 프로그램으로 putty를 기준으로 설명합니다.
![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_Putty_001.png)
1. Category: -> Window -> Appearance에서 원하는 Font 및 크기로 변경합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_Putty_002.png)
2. Category: -> Window -> Translation에서 Remote character set을 UTF-8로 변경합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_Putty_003.png)
3. Category: -> Session에서 IP를 입력하고 Open 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_Putty_004.png)
4. PuTTY Security Alert가 나오면 예를 눌러 계속 진행합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_Putty_005.png)
5. 접속이 완료되었습니다.

## SSH로 접속하기
1. Bash 혹은 OS에 설치되어있는 Shell을 실행합니다.
2. 현재 micro SD에 설치한 Raspbian OS의 ID 및 Password는 아래와 같습니다.
   ID : pi / Password : raspberry
3. 명령어 창에 아래와 같이 입력합니다.
   ssh pi@해당IP
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/004_SSH-login_001.png)
4. SSH 연결이 설정된 적이 없다고 나오면서 계속 연결을 할 것인지 물어봅니다. 'yes'를 입력하여 계속 진행합니다.

### Trouble Shooting
* 공유기에서 raspberry 혹은 raspberrypi 장치를 찾을 수 없는 경우 -> SD이미지를 다시 굽기를 시도하시거나 라즈베리파이 장치 전원을 제거했다가 다시 연결하여 보십시오.
* PC에서 라즈베리파이로 연결할 수 없는 경우 -> 같은 공유기 내에 두 장치가 있는지 확인하여 주십시오.
* WARNING : REMOTE HOST IDENTIFICATION HAS CHANGED! 라는 문구가 뜰 경우 -> ssh-keygen -f "/home/<user>/.ssh/known_hosts" -R <라즈베리파이 IP> 를 입력합니다.