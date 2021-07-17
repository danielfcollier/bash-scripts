#Script para converter de minusculo para maiusculo, os nomes dos numeros de um arquivo.

#!/bin/bash

E_BADARGS=65

#Forma de uso do script.
if [ "$1" == "" ]; then 
    echo "Uso: `basename $0` <file>"
    exit $E_BADARGS
fi

#Entrada: arquivo com as minusculas.

sed 's/um/UM/g' $1 > temp
mv -f temp $1
sed 's/dois/DOIS/g' $1 > temp
mv -f temp $1
sed 's/tr�s/TRES/g' $1 > temp
mv -f temp $1
sed 's/tres/TRES/g' $1 > temp
mv -f temp $1
sed 's/quatro/QUATRO/g' $1 > temp
mv -f temp $1
sed 's/cinco/CINCO/g' $1 > temp
mv -f temp $1
sed 's/seis/SEIS/g' $1 > temp
mv -f temp $1
sed 's/meia/MEIA/g' $1 > temp
mv -f temp $1
sed 's/sete/SETE/g' $1 > temp
mv -f temp $1
sed 's/oito/OITO/g' $1 > temp
mv -f temp $1
sed 's/nove/NOVE/g' $1 > temp
mv -f temp $1
sed 's/zero/ZERO/g' $1 > temp
mv -f temp $1



