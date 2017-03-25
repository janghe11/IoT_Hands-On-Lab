# 사람이 다가오면 자동문이 열림 - 입출력

## 입출력 준비
* D4 포트에 Ultrasonic Ranger 키트를 연결합니다.

## 실행
* `iot-raspbian` 폴더에서 `sudo python 07_ultrasonic-relay.py`를 입력합니다.
* 손과 센서와의 거리가 10cm 이내이면 자동으로 Relay가 On이 됩니다.

## 결론
* 사람의 인위적인 상호작용이 없어도 자동으로 동작이 되는 프로그램을 작성할 수 있습니다.

## 과제
* 손과 센서와의 거리를 원하는 cm로 변경해 봅니다.
* Relay 대신 LED를 연결하여 LED를 On Off해 봅니다.
