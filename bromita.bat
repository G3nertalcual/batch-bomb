@echo off
setlocal

REM Definir variables
set /a intentos=0
set /a aciertos=0

REM Funcion para mostrar un problema matematico y verificar la respuesta
:pregunta
set /a num1=%random% %% 10 + 1
set /a num2=%random% %% 10 + 1
set /a resultado=num1+num2

echo.
echo Problema %1: ?Cuanto es %num1% + %num2% ?
set /p respuesta="Respuesta: "

REM Verificar la respuesta
if %respuesta% equ %resultado% (
    echo !Correcto!
    set /a aciertos+=1
) else (
    echo Respuesta incorrecta.
    set /a intentos+=1
)

REM Verificar si se han hecho dos intentos incorrectos
if %intentos% equ 2 (
    echo.
    echo Has fallado dos veces. Abriendo el video de "Never Gonna Give You Up"...
    start "" "www.youtube.com/watch?v=dQw4w9WgXcQ"
    timeout /t 5 >nul
    echo.
    echo Bloqueando la laptop...
    rundll32.exe user32.dll,LockWorkStation
    goto :fin
)

REM Verificar si se han respondido correctamente los tres problemas
if %aciertos% equ 3 (
    echo.
    echo !Felicidades! Has resuelto todos los problemas correctamente.
    goto :fin
)

REM Realizar la siguiente pregunta
goto :pregunta

:fin
endlocal
