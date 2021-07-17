# Script para calcular o tempo medio
#de cada letra no arquivo

function valor(n,m) {return x=m+n} 
 
NF>=3 {    
      char[i]=$3
      dtempo[i]=(($2)-($1)) 
      i++ 
}

END {   
    
   for(j=1;j<=(i-1);j++) {
   
      if(freq[char[j]]==0) {   
         pos[char[j]]=dtempo[j]    #atribui o intervalo a posicao do caracter no vetor -pos-
	 freq[char[j]]++           
      } else { 
	 v[(j)]=valor(dtempo[j],pos[char[j]]) #soma o intervalo anterior e o novo
	 pos[char[j]]=v[j]                    #acumula na posicao do caracter no vetor -pos-
	 freq[char[j]]++
	}  
   }
   
   for(j in char) {
   
      if(fr[char[j]]==0) {                      #imprime o caracter uma vez
         pos[char[j]]*=(10^(-7))/freq[char[j]]  #converte para segundos e calcula a media 
         print char[j],"=",pos[char[j]],"s"
	 fr[char[j]]++
      }	               
   }      
}   







	


	

