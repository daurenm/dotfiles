#!/bin/sh
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
~/xcape/xcape -e 'Control_L=Escape'

