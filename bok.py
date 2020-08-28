import pyautogui
import time

from PIL import Image

pyautogui.PAUSE = 3

'''
Skriv inn tittel

Trykk på biletet.

'''

time.sleep(10)

	
for side in range(1,141):
	filnamn = 'stygtogpent_4.utg' + f'{side:03}' + '.png'
	pyautogui.screenshot(filnamn)
	pyautogui.typewrite(['right'])
	time.sleep(5)