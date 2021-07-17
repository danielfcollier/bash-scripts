#Script para adicionar como parametro o nome do locutor aos arquivos do banco de dados.

#!/bin/bash

#Utiliza como nome para o locutor o nome do diretorio de origem.
#Retorna um diretorio com os arquivos modificados.

#Inicialização das variáveis.
contI=0
contO=0
in=0
out=0
inDir=""
outDir=""
E_BADARGS=65

#Aviso para uso incorreto.
if [ "$1" != "-i" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Identifica os diretorios de entrada.
for i in $*; do
    if [ "$i" == "-o" ]; then
        break;
    fi
    
    if [ $contI == 1 ]; then
        inDir=$inDir+$i
        inDir=${inDir//+/ }
        let "in+=1"   
    fi
  
    if [ "$i" == "-i" ]; then
        contI=1
    fi
done

#Mensagem de erro para uso incorreto.
if [ "$contI" == "0" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Verifica se existe o arquivo de entrada.
if [ "$inDir" == "" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Identifica os diretorios de saida.
for i in $*; do
    if [ $contO == 1 ]; then
        outDir=$outDir+$i
        outDir=${outDir//+/ }
        let "out+=1"   
    fi
  
    if [ "$i" == "-o" ]; then
        contO=1
    fi
done

#Mensagem de erro para uso incorreto.
if [ "$contO" == "0" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Verifica se existem, os diretorios de saida.
if [ "$outDir" == "" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Verifica se existe a mesma quantidade de diretorios de entrada e saida.
if [ "$in" != "$out" ]; then
    echo "Uso: `basename $0` -i dir1 dir2 ... -o out-dir1 out-dir2 ..."
    exit $E_BADARGS
fi

#Cria vetores cujos elementos sao os diretorios de E/S. 
cont=0
for i in $inDir; do
    vetIn[$cont]=$i
    let "cont+=1"
done

cont=0
for i in $outDir; do
    vetOut[$cont]=$i
    let "cont+=1"
done

#Adiciona os nomes dos locutores nos arquivos.
for((i=0; i<$cont; i=$((i+1)))); do
    if [ -d ${vetIn[$i]} ]; then
        LIST=`ls ${vetIn[$i]}`
        if [ -d ${vetOut[$i]} ];then
            echo ${vetOut[$i]}" ja existe."
        else
             mkdir ${vetOut[$i]}
             LIST=`ls ${vetIn[$i]}`
             for x in $LIST; do
                 awk -v locutor=${vetIn[$i]} '{ printf "%s %s\n" ,locutor , $0 }' ${vetIn[$i]}/$x > ${vetOut[$i]}/$x 
             done
         fi
     else 
         echo ${vetIn[$i]}" nao é um diretorio."
     fi
 done
