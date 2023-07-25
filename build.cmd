@echo off
REM --onefile or --onedir (default) --icon=./icon.ico
REM pyinstaller -w --noconfirm --onefile --console --name=mcods ./server.py
pyinstaller ./mcods.spec