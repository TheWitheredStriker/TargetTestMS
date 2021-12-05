:: Automate packaging the game into an executable

@echo off
copy /b love.exe + %1 "%~n1.exe"