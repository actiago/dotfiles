#!/usr/bin/env bash

echo "Insira o nome da chave: "
read KEYNAME

ssh-keygen -t rsa -b 4096 -C "$KEYNAME" -f "/home/tiago/.ssh/id_rsa-$KEYNAME" -q
