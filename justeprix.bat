rem //////////////////////////////////////////////////////

rem Creator: Joe

rem //////////////////////////////////////////////////////

@echo off

set nbrmin=0
set nbrmax=100
set nbrcoups=0

:nbraleatoire
set nbr=%RANDOM%
	if %nbr% GTR %nbrmax% (goto :nbraleatoire)
	if %nbr% LSS %nbrmin% (goto :nbraleatoire)

:menu
color b
title Menu Juste Prix
cls
echo ----------------------------------
echo Un nombre aleatoire a ete genere. A vous de le retrouver en utilisant le moins de coups possible !
echo ----------------------------------
pause
goto :game

:game
title Juste Prix
cls
color b
echo ----------------------------------
echo Nombre de coups: %nbrcoups%
echo ----------------------------------
echo Dernier nombre: %plynbr%
echo ----------------------------------
set /a nbrcoups=%nbrcoups% + 1
set /p plynbr=Entrez un nombre:
	if %plynbr%==%nbr% (goto :win)
	if %plynbr% GTR %nbr% (goto :nbrinf)
	if %plynbr% LSS %nbr% (goto :nbrsup)
echo ----------------------------------

:nbrinf
cls
color c
echo C'est plus bas !
ping 0.0.0.0 -n 2 > nul
goto :game

:nbrsup
cls
color 2
echo C'est plus haut !
ping 0.0.0.0 -n 2 > nul
goto :game

:win
color b
title Felicitation
cls
echo ----------------------------------
echo Bravo ! Vous avez trouve le nombre %nbr% en %nbrcoups% coups
echo ----------------------------------
pause
cls
echo ----------------------------------
set /p retry=Voulez-vous rejouer ? (Oui/Non): 
echo ----------------------------------
	if %retry%==Oui (goto :menu)
	if %retry%==oui (goto :menu)
exit