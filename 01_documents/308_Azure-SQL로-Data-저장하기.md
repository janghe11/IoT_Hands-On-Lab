# Azure SQL로 Data를 가공하여 저장하기

   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_001.png)
1. 새로만들기 -> Databases -> SQL Database를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_002.png)
2. 위 사진과 같이 데이터베이스 이름과 리소스 그룹, 서버 등을 선택합니다. 서버 이름은 소문자로 입력합니다.<br />
   서버 관리자 로그인 및 암호는 원하는대로 설정합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_003.png)
3. 사용량에 맞게 가격 계층을 설정합니다. 여기에서는 최소로 설정합니다. 이후 만들기를 누릅니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_004.png)
4. 서버 방화벽 설정에서 규칙 이름 : free / 시작 IP : 0.0.0.0 / 종료 IP : 255.255.255.255 으로 설정합니다. (모든 IP 범위 허용)
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_008.png)
5. SQL Database에서 도구 -> 쿼리 편집기를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_009.png)
6. 로그인 버튼을 눌러 이전에 생성한 ID와 비밀번호로 로그인 합니다.
7. 쿼리문 입력란에 아래와 같이 입력하고 실행 버튼을 눌러 테이블을 생성합니다. 오류가 없으면 테이블이 생성된 것입니다.
~~~
   CREATE TABLE [dbo].[SensorData] (
       [Id]          INT           IDENTITY (1, 1) NOT NULL,
	   DeviceID	  varchar(20)	NOT NULL,
       [Temperature] double        NULL,
       [Humidity]    double        NULL,
       [Dust]        double        NULL,
       [RegiDate]    SMALLDATETIME DEFAULT (getdate()) NULL,
       PRIMARY KEY CLUSTERED ([Id] ASC)
   );
~~~
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_005.png)
5. 스트림 분석에서 쿼리를 수정하여 SQL에도 데이터가 입력되도록 설정합니다. 작업 토폴로지에서 쿼리를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_006.png)
6. 기존 쿼리에 아래 사항을 추가하고 저장합니다.<br />
   입력 데이터를 1분 마다 데이터를 묶어 각 항목 별 평균값을 구하여 테이블에 저장
~~~
   SELECT
        DeviceID, AVG(temperature)as Temperature, AVG(humidity) as Humidity, AVG(dust) as Dust
   INTO
       OUTPUTSQL
   FROM
       INPUT
   GROUP BY DeviceID, TumblingWindow(Minute, 1)
~~~
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_007.png)
7. 상단의 중지 버튼을 누르고 작업 토폴로지에서 출력을 선택하고 위와 같이 입력합니다. 이후 시작 버튼을 눌러 다시 스트림 입출력을 시작합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_008.png)
8. SQL Database에서 도구 -> 쿼리 편집기를 선택합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_009.png)
9. 로그인 버튼을 눌러 이전에 생성한 ID와 비밀번호로 로그인 합니다.
   ![alt tag](https://github.com/janghe11/IoT_Hands-On-Lab/blob/master/pictures/308_Database_010.png)
10. SELECT * FROM dbo.SensorData 를 입력하고 실행 버튼을 눌러 결과 항목에서 출력된 데이터를 확인합니다.
