#Script para executar o passo 7 do tutorial de HTK.

#!/bin/bash

E_BADARGS=65

#Forma de uso do script.
if [ "$1" == "" ]; then 
    echo "Uso: `basename $0` <dir1> <2dir2>"
    exit $E_BADARGS
fi

cp $1/macros $2/macros
cp $1/hmmdefs $2/hmmdefs
