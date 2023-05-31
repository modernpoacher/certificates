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
  -new \
  -nodes \
  -newkey rsa:4096 \
  -keyout certificates/localhost.key \
  -out certificates/localhost.csr \
  -subj "$SUBJ"
