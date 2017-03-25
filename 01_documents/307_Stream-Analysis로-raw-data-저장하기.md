# Stream Analysis와 Blob Data Storage로 Raw Data 저장하기

   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_001.png)
1. 새로만들기 -> 사물인터넷 -> Stream Analytics Job을 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_002.png)
2. 적절한 작업 이름과 리소스 그룹은 IoT Hub를 생성하면서 사용하였던 그룹을 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_003.png)
3. 작업 토폴로지에서 입력을 선택하고 추가 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_004.png)
4. 설정을 아래와 같이 입력하고 만들기 버튼을 누릅니다.<br />
   입력 별칭 : INPUT<br />
   원본 유형 : 데이터 스트림<br />
   원본 : IoT Hub<br />
   가져오기 옵션 : 현재 구독의 IoT Hub 사용<br />
   IoT Hub : 이전에 생선한 IoT Hub 선택<br />
   끝점 : 메시지
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_005.png)
5. Blob Storage를 생성하기 위하여 새로만들기 -> Storage -> Storage Account를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_006.png)
6. 소문자로 적절한 이름을 입력하고 기존에 사용하였던 리소스 그룹을 선택하고 만들기 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_007.png)
7. 서비스에서 Blob을 선택하고 Blob Service에서 컨테이너를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_008.png)
8. 적절한 컨테이너 이름을 입력하고 만들기 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_009.png)
9. 입력 토폴로지를 설정하였으니 이제 출력 토폴로지를 설정합니다. 작업 토폴로지에서 출력을 선택 후 추가 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_010.png)
10. 설정을 아래와 같이 입력하고 만들기 버튼을 누릅니다.<br />
   입력 별칭 : OUTPUT<br />
   싱크 : Blob 저장소<br />
   가져오기 옵션 : 현재 구독의 IoT Hub 사용
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_011.png)
11. 입력에서 출력으로 데이터를 전송하기 위한 쿼리를 설정합니다. 작업 토폴로지에서 쿼리를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_012.png)
12. 기본 쿼리에서 INTO 항목은 OUTPUT으로, FROM 항목은 INPUT으로 수정하고 저장 버튼을 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_014.png)
13. 시작 버튼을 눌러 스트림 분석을 시작합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_016.png)
14. Blob Service의 컨테이너에서 json 형식의 파일이 생성되었는지 확인합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/307_Stream_017.png)
15. 다운로드를 눌러 파일을 확인하면 IoT 장치에서 생성된 Raw Data가 저장되어 있는 것을 볼 수 있습니다.
