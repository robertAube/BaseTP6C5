@echo off
rem Robert Aubé : version 7 mars 2022

REM Où envoyer le ZipFile
set "BaseName=P:\cegep\6C5 - Applications de jeux et simulations II\prjUnity\"

REM Pour avoir la date
FOR /F "TOKENS=1 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET dd=%%A
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2,3 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET yyyy=%%C

REM Pour avoir l'heure
set h=%TIME:~0,2%
set m=%TIME:~3,2%
set/a m2="m+5"
set Heure=%h%:%m2%

REM La date et l'heure sont utilisez pour le message du commit
set Maintenant=%yyyy%%mm%%dd% %Heure%

REM Trouver le nom du répertoire courant
for %%I in (.) do set CurrDirName=%%~nxI
set "FileName=%BaseName%%CurrDirName%-"


REM Trouver le nom du fichier destination .zip
REM Le même zip peut se retrouver plusieurs fois puisqu'on lui joint un numéro unique.
set "FileNumber=0"
:FileNameLoop
set /A FileNumber+=1
if exist "%FileName%%FileNumber%.zip" goto FileNameLoop

echo "%FileName%%FileNumber%.zip"

REM Commande git add, commit & push
git add *
git commit -m "commit for zip - %Maintenant%"
git push -u origin --all
REM Commande git pour archiver le HEAD dans un .zip 
git archive -o "%FileName%%FileNumber%.zip" HEAD

pause
