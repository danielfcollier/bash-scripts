#Script para renomear todos os arquivos com extensao -$1-

#!/bin/bash

E_BADARGS=65

#Forma de uso do script.
if [ "$1" == "" ]; then 
    echo "Uso: `basename $0` <o que deve ser listado do diretorio> <regex> <replacement>"
    exit $E_BADARGS
fi

#Substituicao.
comando="ls "$1" | sed 's,"$2","$3",'"
echo $comando | sh > temp
lista="ls "$1" | awk '{print \$1 }'"
echo $lista | sh > temp2
cat temp2 temp | awk 'BEGIN{i=1} {move[i]=$1;i++} END{limite=i/2; for (j = 1; j <= limite; j++) { k=int(j+limite); print "mv -f",move[j],move[k] }}' | sh 
rm -f temp
rm -f temp2


