# Button입력을 받으면 LED 출력하기

## 입출력 준비
* D2 포트에 Button 키트를 연결합니다.
* D4 포트에 LED-Red 키트를 연결합니다.

## 실행
* `iot-raspbian` 폴더에서 `sudo python 04_button-led.py`를 입력하여 스위치를 누르면 1초 뒤 LED가 깜빡이는것을 확인합니다.

## 결론
* PORT 번호에 따라 원하는 핀을 사용할 수 있습니다.(단, Digital, Analog, i2c는 구분하여 사용)
* digitalRead() 메소드와 digitalWrite() 메소드로 입출력을 받아들이고 제어할 수 있습니다.

## 과제
* 버튼과 LED를 서로 바꾸어 동작이 되도록 해봅시다.
