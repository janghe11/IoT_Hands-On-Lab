# Analog 입력을 받아 LED 출력하기

## 입출력 준비
* A2 포트에 Rotary Switch 키트를 연결합니다.
* D4 포트에 LED-Red 키트를 연결합니다.

## 실행
* `iot-raspbian` 폴더에서 `sudo python 04_rotary-led.py`를 입력하여 Rotary Switch를 돌리면 0 ~ 1023 사이의 값을 출력하며 LED 밝기가 조절됩니다..

## 결론
* 0 ~ 5V의 값을 Analog 입력을 통해 조절할 수 있습니다.
* analogRead() 메소드로 입출력을 받아들이고 제어할 수 있습니다.
