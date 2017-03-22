# Raspberry Pi로 SSH를 통하여 접속하기
Raspberry Pi를 사용하기 위해서는 크게 SSH를 통한 접속과 HDMI, Keyboard, Mouse를 통한 콘솔 직접 접속이 있습니다.<br />
여기에서는 원격으로 접속하여 제어할 수 있는 SSH 접속에 대하여 설명합니다.

## SSH로 접속하기 위한 환경 구성
Mac OS나 Linux의 경우 SSH 접속 프로그램이 대부분 설치되어 있습니다. Windows의 경우 접속을 위한 프로그램을 설치하여야 합니다.

### Windows 10 64bit - Bash on Ubuntu on Windows
본 과정은 Windows 10 64bit(Home, Pro)에서 Linux의 기능을 사용할 수 있도록 활성화하는 방법을 안내합니다.<br />
cygwin과 같은 Linux binary 프로그램을 Windows용으로 따로 porting 할 필요 없이 native 프로그램을 그대로 사용할 수 있습니다.
1. 시작 -> 검색 -> 제어판 -> 프로그램 및 기능을 실행합니다.
2. 좌측 상단에서 Windows 기능 켜기/끄기를 누릅니다.
3. Linux용 Windows 하위 시스템(베타)을 선택합니다.
4. 확인을 눌러 설치를 시작합니다.
5. Windows를 다시 시작 합니다.
6. 시작 -> 검색 -> 명령 프롬프트를 실행합니다.
7. 명령어창에 **'bash'** 라고 입력합니다.
8. 설치 여부를 묻는 물음에 **'y'**를 입력합니다.
9. 사용자 이름을 원하는 이름으로 설정합니다.
10. 사용자의 원하는 비밀번호를 설정합니다.

### Windows 10 32bit 및 8 이하 버전
Bash on Ubuntu on Windows 외에 접속할 수 있는 프로그램은 putty, xshell, cygwin등 여러가지 방법이 있습니다.<br />
여기에서는 대표적인 프로그램으로 putty를 기준으로 설명합니다.
1. 

## SSH로 접속하기
1. Bash 혹은 OS에 설치되어있는 Shell을 실행합니다.
2. 현재 micro SD에 설치한 Raspbian OS의 ID 및 Password는 아래와 같습니다.
   ID : pi / Password : raspberry
3. 명령어 창에 아래와 같이 입력합니다.
   ssh pi@해당IP
   ![alt tag](004_SSH-login_001)
4. SSH 연결이 설정된 적이 없다고 나오면서 계속 연결을 할 것인지 물어봅니다. 'yes'를 입력하여 계속 진행합니다.
