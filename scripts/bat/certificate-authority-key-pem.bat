@echo off
if not "%~1" == "" (
  set SUBJ=%~1
)

if "%SUBJ%" == "" (
  set SUBJ=/C=UK/ST=England/L=Greenwich/O=Modern Poacher Limited/CN=Modern Poacher/emailAddress=modernpoacher@modernpoacher.com
)

openssl req -x509 -nodes -new -sha512 -days 3650 -newkey rsa:4096 -keyout certificates\certificate-authority.key -out certificates\certificate-authority.pem -subj "%SUBJ%"
