#Script para modificar os nomes dos caminhos nos arquivos

#!/bin/bash

#[-g]: para substituicao em todas as ocorrencias na frase.
E_BADARGS=65

#Forma de uso do script.
if [ "$1" == "" ]; then 
    echo "Uso: `basename $0` <regex> <replacement> <file> [-g]"
    exit $E_BADARGS
fi

#Modificar locais com barras e espa�os.
in_value=`echo $1 | awk '{ gsub(/\//,"\/", $0); gsub(/ /,"\\\\\ ", $0); print $0}'`
out_value=`echo $2 | awk '{ gsub(/\//,"\/", $0); gsub(/ /,"\\\\\ ", $0); print $0}'`
file=$3

#Substituicao na primeira ocorrencia.
if [ "$4" == "" ]; then
    echo "sed s'/"$in_value"/"$out_value"/' "$file"" | sh  > temp
    mv temp $file
fi

#Substituicao global.
if [ "$4" == "-g" ]; then
    echo "sed s'/"$in_value"/"$out_value"/g' "$file"" | sh > temp 
    mv temp $file
fi
