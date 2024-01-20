@echo off
haxelib run formatter -s src
waitfor NotHappen /t 5
exit 0
