@echo off
title VNULIB DOWNLOADER ! (PREMIUM VERSION)
mode con:cols=80 lines=30
setlocal EnableDelayedExpansion

call :print
set /p link=LINK: 
mkdir "%~dp0vnulib_downloader"
echo [InternetShortcut] >> "%~dp0%vnulib_downloader\LINK.url"
echo URL=!link! >> "%~dp0%vnulib_downloader\LINK.url"
for /f "tokens=1,2 delims=&" %%a in ("%link%") do (
    for /f "tokens=2 delims==" %%c in ("%%a") do (
        set "subfolder=%%c"
    )
    for /f "tokens=2 delims==" %%d in ("%%b") do (
        set "doc=%%d"
    )
)
echo.
set /p from_page=FROM PAGE: 
echo.
set /p to_page=TO PAGE: 

call :print
mkdir "%~dp0vnulib_downloader\image"
set i=%from_page%
:download
echo DOWNLOADING PAGE !i!...
set url=https://ir.vnulib.edu.vn/flowpaper/services/view.php?doc=!doc!^&format=jpg^&page=!i!^&subfolder=!subfolder!
curl -o vnulib_downloader\image\page_!i!.jpg "!url!"
set /a i+=1
call :print
if !i! LEQ %to_page% goto download
echo "OK !"
@echo off
title VNULIB DOWNLOADER ! (PREMIUM VERSION)
mode con:cols=80 lines=30
setlocal EnableDelayedExpansion
call :print

set /p link=LINK: 
mkdir "%~dp0vnulib_downloader"
echo [InternetShortcut] >> "%~dp0%vnulib_downloader\LINK.url"
echo URL=!link! >> "%~dp0%vnulib_downloader\LINK.url"
for /f "tokens=1,2 delims=&" %%a in ("%link%") do (
    for /f "tokens=2 delims==" %%c in ("%%a") do (
        set "subfolder=%%c"
    )
    for /f "tokens=2 delims==" %%d in ("%%b") do (
        set "doc=%%d"
    )
)
echo.
set /p from_page=FROM PAGE: 
echo.
set /p to_page=TO PAGE: 
call :print

mkdir "%~dp0vnulib_downloader\image"
set i=%from_page%
:download
echo DOWNLOADING PAGE !i!...
set url=https://ir.vnulib.edu.vn/flowpaper/services/view.php?doc=!doc!^&format=jpg^&page=!i!^&subfolder=!subfolder!
curl -o vnulib_downloader\image\page_!i!.jpg "!url!"
set /a i+=1
call :print
if !i! LEQ %to_page% goto download
echo OK
pause

:print
cls
echo ********************************************************************************
echo ******************** DOWNLOADER EBOOK FROM IR.VNULIB.EDU.VN ********************
echo ******************************* CODE BY @TLATONF *******************************
echo ********************************************************************************
echo *****                                                                      *****
echo *****      SS\     SS\            SS\                          SSSSSS\     *****
echo *****      SS \    SS \           SS \                        SS  __SS\    *****
echo *****    SSSSSS\   SS \ SSSSSS\ SSSSSS\    SSSSSS\  SSSSSSS\  SS /  \__\   *****
echo *****    \_SS  _\  SS \ \____SS\\_SS  _\  SS  __SS\ SS  __SS\ SSSS\        *****
echo *****      SS \    SS \ SSSSSSS \ SS \    SS /  SS \SS \  SS \SS  _\       *****
echo *****      SS \SS\ SS \SS  __SS \ SS \SS\ SS \  SS \SS \  SS \SS \         *****
echo *****      \SSSS  \SS \\SSSSSSS \ \SSSS  \\SSSSSS  \SS \  SS \SS \         *****
echo *****       \____/ \__\ \_______\  \____/  \______/ \__\  \__\\__\         *****
echo *****                                                                      *****
echo ********************************************************************************
echo ********************************************************************************
echo.
goto :eof