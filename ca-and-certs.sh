#!/bin/bash

if [ -z "$1" ];
then
  SUBJ="/C=UK/ST=England/L=Greenwich/O=Modern Poacher Limited/CN=Modern Poacher/emailAddress=modernpoacher@modernpoacher.com"
else
  SUBJ=$1
fi

mkdir certificates 2> /dev/null

source scripts/sh/certificate-authority-key-pem.sh
source scripts/sh/certificate-authority-crt.sh
source scripts/sh/localhost-csr.sh
source scripts/sh/localhost-crt.sh
