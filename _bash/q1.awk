#Script para listar os caracteres do arquivo

NF>=3 {                         
   $3=tolower($3)                
   char[i]=$3
   i++  
}
END {

   for(j=1;j<=(i-1);j++) {
    
      if(freq[char[j]]==0) {     #Se o fonema ja tiver aparecido... 
         print char[j]           #...nao sera impresso  
         freq[char[j]]++
      }
   }
}      	 