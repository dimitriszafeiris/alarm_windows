@echo off          
:start
:W
  SETLOCAL
  For /f "tokens=1-3 delims=1234567890 " %%a in ("%time%") Do set "delims=%%a%%b%%c"
  For /f "tokens=1-4 delims=%delims%" %%G in ("%time%") Do (
    Set _hh=%%G
    Set _min=%%H
    Set _ss=%%I
    Set _ms=%%J
  )
  :: Strip any leading spaces
  Set _hh=%_hh: =%
 
  :: Ensure the hours have a leading zero
  if 1%_hh% LSS 20 Set _hh=0%_hh%
 
  rem Echo The time is:   %_hh%:%_min%:%_ss%
  ENDLOCAL&Set _time=%_hh%:%_min%:%_ss%
if %_time% GTR 07:30:00 goto :Wake
echo sleeping 5 sec.....
ping 127.0.0.1 /n 5 > nul
goto :W

:Wake
echo Wake up...
start https:https://www.youtube.com/watch?v=5TgiH5Rr3M0
start hello.vbs
exit /b
rem shutdown.exe /s /f /t 60 /c "Go to bed!!!!!!"