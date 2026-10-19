@echo off
setlocal
set ROOT=%~dp0..
set JAVA=%ROOT%\tools\jdk-21\bin\java.exe
set LSPATCH_JAR=%ROOT%\tools\lspatch-v1.2-487-release.jar
set INPUT_APK=%ROOT%\apk\in\xiaopeng-mycarinfo-appchina.apk
set MODULE_APK=%ROOT%\modules\SpoofMyDevice-v2.0.1.apk
set OUT_DIR=%ROOT%\apk\out

if not exist "%JAVA%" (
  echo [!] JDK 21 missing
  exit /b 1
)
if not exist "%LSPATCH_JAR%" (
  echo [!] missing LSPatch jar
  exit /b 1
)
if not exist "%INPUT_APK%" (
  echo [!] missing Xiaopeng APK in apk\in
  exit /b 1
)
if not exist "%MODULE_APK%" (
  echo [!] missing SpoofMyDevice module
  exit /b 1
)

mkdir "%OUT_DIR%" 2>nul
echo [*] Patching with embedded SpoofMyDevice...
"%JAVA%" -jar "%LSPATCH_JAR%" -f -m "%MODULE_APK%" -o "%OUT_DIR%" "%INPUT_APK%"
if errorlevel 1 (
  echo [!] patch failed
  exit /b 1
)
echo [+] done:
dir /b "%OUT_DIR%"
endlocal
