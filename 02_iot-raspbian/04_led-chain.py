#-*- coding: utf-8 -*-
#!/usr/bin/env python

# GrovePi LED blink Example for the Grove LED Socket (http://www.seeedstudio.com/wiki/Grove_-_LED_Socket_Kit)
#
# The GrovePi connects the Raspberry Pi and Grove sensors.  You can learn more about GrovePi here:  http://www.dexterindustries.com/GrovePi
#
# Have a question about this example?  Ask on the forums here:  http://forum.dexterindustries.com/c/grovepi
#
'''
## License

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

# Connect the Grove LED to digital port D4
led_red = 2
led_blue = 3
led_green = 4

pinMode(led_red,"OUTPUT")
pinMode(led_blue,"OUTPUT")
pinMode(led_green,"OUTPUT")
time.sleep(1)

print ("LED 켜고 끄기를 시작합니다. 프로그램을 종료하시려면 Ctrl + C를 눌러주세요")

while True:
    try:
        #Blink the LED
        digitalWrite(led_red,0)		# Send HIGH to switch on LED
        digitalWrite(led_blue, 1)
        digitalWrite(led_green, 1)
        time.sleep(1)

        digitalWrite(led_red, 1)  # Send HIGH to switch on LED
        digitalWrite(led_blue, 0)
        digitalWrite(led_green, 1)
        time.sleep(1)

        digitalWrite(led_red, 1)  # Send HIGH to switch on LED
        digitalWrite(led_blue, 1)
        digitalWrite(led_green, 0)
        time.sleep(1)

    except KeyboardInterrupt:	# Turn LED off before stopping
        digitalWrite(led_red, 1)  # Send HIGH to switch on LED
        digitalWrite(led_blue, 1)
        digitalWrite(led_green, 1)
        break
    except IOError:				# Print "Error" if communication error encountered
        print ("Error")