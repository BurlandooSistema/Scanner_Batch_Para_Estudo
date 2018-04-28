rem https://www.youtube.com/channel/UCXk2jugIKXDKKDAD-JHL2fg/videos
@echo off
title "HOST FINDER | OS FINDER" 
:comeco_programa
set /p fixo="Digite a parte do ip que nao se altera dessa maneira xxx.xxx.xxx(exemplo: 192.168.0.): "
set /p prefixos="Digite os prefixos da maneira explicada acima: "
set /p numero="Digite o numero inicial: "
set /p limite="Digite o numero limite: "
echo Criador Canal Burlando o Sistema : https://www.youtube.com/channel/UCXk2jugIKXDKKDAD-JHL2fg/videos
echo Scan Realizado em: %DATE% as %TIME% horas  >ips_on.txt

:start
set /a t=255
set l="%t%"
set /a numero = %numero% + 1
if %numero% GEQ %limite% goto fim
ping %prefixos% %fixo%%numero% | find "TTL" >temp.txt
rem echo valor: %errorlevel%
IF %errorlevel% EQU 0 (
echo -----------------------------------------------------
echo ----------------------------------------------------- >>ips_on.txt
echo o ip:%fixo%%numero% esta on>>ips_on.txt
echo o ip:%fixo%%numero% esta on
goto mac
) 
goto nfuncionou

:funcionou
find %l% temp.txt>nul
rem echo valor: %errorlevel%
IF %errorlevel% EQU 0 (goto so)
IF %errorlevel% NEQ 0 (goto add)

:nfuncionou
  ECHO O Ip: %fixo%%numero% ta off
goto start

:fim
echo fim do programa! 
set fixo=""
set numero=""
set limite=""
set /a t=0
set l=""
timeout /t 5 >nul
cls
del temp.txt
del x.txt
type ips_on.txt
pause>nul
goto comeco_programa

:mac
set "ip=%fixo%%numero%"
echo %ip%
arp -a | find  "%ip%" > x.txt
find "--- 0xe" x.txt >nul
IF %errorlevel% EQU 0 (echo Maquina atual && echo Maquina atual >>ips_on.txt && goto start )
for /f "tokens=*" %%x in (x.txt) do set x2=%%x
set a=%x2: =%
set a= %a:~-25%
echo endereço mac: %a:~1,17%
echo endereço mac: %a:~1,17% >>ips_on.txt
echo do tipo: %a:~18,25%
echo do tipo: %a:~18,25% >>ips_on.txt
goto funcionou

:so
rem echo vai testas agora
rem echo t=%t%
rem echo l=%l%
IF %t% LEQ 64  (
echo Provavelmente e um linux Com uma Resposta de TTL=%t%>>ips_on.txt
echo Provavelmente e um linux Com uma Resposta de TTL=%t%
goto start
) 
IF %t% LEQ 128 (
echo Provavelmente e um windows Com uma Resposta de TTL=%t%>>ips_on.txt
echo Provavelmente e um windows Com uma Resposta de TTL=%t%
goto start
)
IF %t% LEQ 255  (
echo Provavelmente e um unix Com uma Resposta de TTL=%t%>>ips_on.txt
echo Provavelmente e um unix Com uma Resposta de TTL=%t%
goto start
) 

:add
set /a t=%t%-1
set l="TTL=%t%"
rem echo %l%
goto funcionou






