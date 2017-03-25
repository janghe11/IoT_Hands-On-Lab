# 가정용 간이 온습도계 만들기

## 입출력 준비
* I2C 포트에 LCD 키트를 연결합니다.
* D7 포트에 Temerature-Humid 키트를 연결합니다.

## 실행
* `iot-raspbian` 폴더에서 `sudo python 09_dht-lcd.py`를 입력합니다.

## 결론
* 센서에서 수집한 데이터를 LCd에 출력할 수 있습니다.
* 일정 시간마다 동작하도록 설정할 수 있습니다. (time.sleep(second))

## 과제
* 1초마다 데이터를 수집하여 출력하도록 수정해 봅니다.
