# Raspbian OS 설치 및 실행
본 항목은 Raspbian OS를 현재 노트북 운영체제에 맞게 micro SD에 설치하고 실행하는 방법에 대해 안내합니다.

## micro SD에 Raspbian OS 설치하기
### Windows
* Windows는 앞서 다운로드 받은 **Win32 Disk Imager** 라는 프로그램을 이용하여 이미지를 설치합니다.
  1. 다운로드 받은 Win32 Disk Imager를 다운로드 하고 실행합니다.
  ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/003_Win32DiskImager_001.png)
  2. Image File 항목에서 Browse 아이콘을 클릭한 다음 앞서 받은 Raspbian OS **img** 확장자 파일을 선택합니다.
  3. Device 항목에서 현재 micro SD가 장착되어 있는 드라이브를 선택합니다.
  4. 맨 아래 **Write** 버튼을 클릭하여 이미지 쓰기를 시작합니다.
  ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/003_Win32DiskImager_002.png)
  5. Confirm Overwrite문구(안의 내용을 포맷하고 덮어 씀)가 나오면 Yes를 클릭합니다.
  ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/003_Win32DiskImager_003.png)
  6. 이미지 쓰기가 완료 될 때까지 기다립니다.(USB 3.0 기준 약 6 ~ 7분 정도가 소요됩니다.)
  ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/003_Win32DiskImager_004.png)
  7. Write Successful 창이 뜨면 OK를 누르고 안전하게 제거합니다.
  8. Raspberry Pi의 하단에 micro SD를 삽입하고 Lan 케이블을 연결합니다.
     Lan 케이블을 사용할 수 없는 경우 꼽지 않아도 상관없습니다.
  9. micro USB 충전 케이블을 각각 PC와 Raspberry PI에 연결합니다.
