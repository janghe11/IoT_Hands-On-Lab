#-*- coding: utf-8 -*-
# Adjust LED brightness by rotating Potentiometer

# GrovePi + Rotary Angle Sensor (Potentiometer) + LED
# http://www.seeedstudio.com/wiki/Grove_-_Rotary_Angle_Sensor
# http://www.seeedstudio.com/wiki/Grove_-_LED_Socket_Kit

'''
The MIT License (MIT)

GrovePi for the Raspberry Pi: an open source platform for connecting Grove Sensors to the Raspberry Pi.
Copyright (C) 2015  Dexter Industries

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
'''

import time
from grovepi import *

# Connect the LED to digital port D5
button = 4
led = 5

pinMode(button, "INPUT")
pinMode(led,"OUTPUT")

analogWrite(led, 0)
print("입출력 프로그램을 시작합니다. Ctrl + C를 눌러 종료할 수 있습니다.")
print("1초마다 버튼이 눌렸는지 안 눌렸는지 검사합니다.")

while True:
    try:
        button_status = digitalRead(button)
        if button_status:
            digitalWrite(led, 1)
            print("버튼이 눌렸습니다. LED ON")
        else:
            digitalWrite(led, 0)
            print("버튼이 눌려있지 않습니다. LED OFF")
        time.sleep(1)
    except KeyboardInterrupt:
        digitalWrite(led, 0)
        break
    except IOError:
        print("Error")
