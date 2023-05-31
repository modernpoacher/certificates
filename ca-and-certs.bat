@echo off

if "%~1" == "" (
  set SUBJ=/C=UK/ST=England/L=Greenwich/O=Modern Poacher Limited/CN=Modern Poacher/emailAddress=modernpoacher@modernpoacher.com
) else (
  set SUBJ=%~1
)

md certificates > NUL

call scripts\bat\certificate-authority-key-pem.bat
call scripts\bat\certificate-authority-crt.bat
call scripts\bat\localhost-csr.bat
call scripts\bat\localhost-crt.bat
