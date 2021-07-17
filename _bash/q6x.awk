#Script para mostrar a frequencia dos fonemas e indicar o mais frequente.

NF>=3 { 
   freq[$3]++          #cada vez que o caracter aparece o vetor
                       #-freq- eh incrementado na posicao do caracter
}
END {
   max=0
   for(i in freq) {                    #imprime a frequencia de todos os fonemas
      print "freq["i"] =",freq[i]
      
      if(freq[i]>=max) {        #compara a frequencia atual com a anterior, caso ela
         max=freq[i]            #seja maior -max- eh redefinido com o seu valor.  
	 y=i
      }     
   }      
   print "O fonema mais frequente eh -"y"- e sua frequencia eh",freq[y]"."
}                    
