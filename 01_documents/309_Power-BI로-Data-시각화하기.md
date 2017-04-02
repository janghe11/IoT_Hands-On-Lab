# Power BI로 Data 시각화하기
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_001.png)
1. https://www.powerbi.com/ 으로 접속하여 가입하고 로그인 합니다. 이때 가입 이메일은 기업용 이메일이어야 하며, 없다면 onmicrosoft.com으로 새로 생성합니다. 가입 이메일은 기존 Azure 이메일과 일치할 필요는 없습니다.
   ![Power BI Login](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_002.png)
   ![Power BI Login2](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_003.png)
   ![Power BI Login3](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_004.png)
2. Power BI Desktop 버전을 다운로드 받아 실행합니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_005.png)
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_006.png)
3. 로그인 후 데이터 가져오기 -> SQL Server를 클릭합니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_007.png)
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_008.png)
4. Azure Portal에서 생성한 SQL Database를 클릭하고 주소를 복사합니다. 복사한 주소를 서버 항목에 붙여넣기 하고 로드 버튼을 누릅니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_009.png)
5. 해당 Database의 테이블을 불러옵니다. SensorData를 클릭하고 로드 버튼을 누릅니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_010.png)
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_011.png)
6. 우측에서 테이블의 필드 항목에 따라 합계로 나타난 것을 보실 수 있습니다. 원하는 부분만 클릭하여 가운데에 시각화 할 수 있습니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_012.png)
7. 우측 필드 항목을 클릭하시면 평균값 및 각종 계산을 사용할 수 있습니다.
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_013.png)
   ![Power BI Main](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/309_PowerBI_014.png)
8. 그래프 상단의 포커스 모드를 누르시면 해당 그래프만 확대하여 보실수 있으며, 상황에 맞게 다른 그래프 유형을 선택하실 수 있습니다.

이로서 모든 IoT Hands-on-lab을 마쳤습니다.<br />
더 자세한 사항은 [iot-gateway-sdk](https://docs.microsoft.com/ko-kr/azure/iot-hub/iot-hub-linux-gateway-sdk-get-started) 혹은 [개발자 가이드](https://docs.microsoft.com/ko-kr/azure/iot-hub/iot-hub-devguide)를 참조하여 주십시오. 감사합니다.