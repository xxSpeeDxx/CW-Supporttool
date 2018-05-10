%echo off
cls
goto :Anfang

:Anfang
echo Welchen Fehler hast du?
echo ----------------------------------------------
echo 1= Patcher wird nicht geöffnet
echo 2= Client startet mit Fehlermeldung
echo 3= Client startet nicht (ohne Fehlermeldung)
echo 4= Bekomme Kick nach der Char auswahl
echo ----------------------------------------------
echo Bitte trage nun deine gewünschte Zahl hier ein:
set /p EINGABE=

IF not DEFINED EINGABE goto :Falsche_Eingabe
If "%EINGABE%" == "1" goto :Auswahl1
If "%EINGABE%" == "2" goto :Auswahl2
If "%EINGABE%" == "3" goto :Auswahl3
If "%EINGABE%" == "4" goto :Auswahl4

:Falsche_Eingabe
echo Du hast eine falsche Eingabe getätigt!
echo Bitte trage eine plausible Zahl ein.
pause
cls
goto :Anfang


:Auswahl1
tasklist /FI "IMAGENAME eq Celestial - World.exe" 2>NUL | find /I /N "Celestial - World.exe">NUL
if "%ERRORLEVEL%" == "0" taskkill /F /IM Celestial*
if "%ERRORLEVEL%" == "1" goto :fehler
goto fertig
:fehler
echo Fehler beim Beenden des Patchers. Bitte teste es erneut.
echo Sollte es beim 2. mal nicht klappen wende dich an den ersteller dieses Programms
pause
exit
:fertig
echo Der Patcher wurde erfolgreich geschlossen.
echo Versuche nun den Patcher zu starten.
pause
exit

:Auswahl2
del metin2client.bin /s /q
del pack\cewo.* /s /q
del pack\uiscript.* /s /q
del pack\locale_de.* /s /q
del pack\locale_en.* /s /q
if errorlevel 1 goto error
goto fertig
:error
echo Fehler beim Löschen der Dateien.
pause
exit
:fertig
echo Die  Datei wurde gelöscht.
echo Bitte Patchen und schauen ob der Client wieder geht.
pause
exit

:Auswahl3
echo Es wird nun eine Datei runtergeladen die Sie bitte Installieren.
echo Wenn alles Installiert ist bitte den Client nochmal starten.
start iexplore http://dl.celestial-world.com/misc/VC_RedistInstaller.exe
echo es kann ein paar Minuten dauern bis es aufgeht
pause
exit

:Auswahl4
echo Versuch dein Char über die Homepage zu "Entbuggen".
echo Wenn dies beim ersten mal nicht klappt warte 15 Minuten und versuche es erneut.
echo --------------------------------------------------------------------------------------------
echo Wenn dies immer noch nicht geholfen hat melde dich bitte im Forum mit deinem Fehler.
pause
exit