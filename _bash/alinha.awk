BEGIN {
    i=1
}

{
    vet1[i]=$0
    i++
    limite=NR/CONTADOR
}

END {
    endereco= ENVIRON["LOCAL"]
    split(endereco,end," ")
    
    #Realiza a concatenacao dos arquivos. 
    for(i=1;i<=limite;i++) {
        printf "cat"
     
        for (x=1;x<=CONTADOR;x++) {
            j[x]=i+(x-1)*limite
            a=j[x]
            printf " %s/%s",end[x],vet1[a]
        }
        printf " >> %s\n" ,ENVIRON["OUTPUTFILE"]      
    }    
}
   
