#Script para converter todos os arquivos .DAT para .alaw

#!/bin/bash

E_BADARGS=65

#Forma de uso do script.
if [ "$1" == "" ]; then 
    echo "Uso: `basename $0` <dir>"
    exit $E_BADARGS
fi

#Entrada: diretorio que contem os arquivos .DAT
ls $1/*DAT | sed 's/DAT//' | awk '{print "./msw2lsw "$1"DAT",$1"alaw"}' | /bin/bash 