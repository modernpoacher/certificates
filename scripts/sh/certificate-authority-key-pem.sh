#!/bin/bash

if [ $# -eq 1 ];
then
  SUBJ=$1
fi

if [ -z "$SUBJ" ];
then
  SUBJ="/C=UK/ST=England/L=Greenwich/O=Modern Poacher Limited/CN=Modern Poacher/emailAddress=modernpoacher@modernpoacher.com"
fi

openssl req \
  -x509 \
  -nodes \
  -new \
  -sha512 \
  -days 365 \
  -newkey rsa:4096 \
  -keyout certificates/certificate-authority.key \
  -out certificates/certificate-authority.pem \
  -subj "$SUBJ"
