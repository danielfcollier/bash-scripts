#Script para calcular o tempo medio
#de cada letra na frase

function dur(a,b) {return y = a-b}
function media(n,m) {return x = (m+n)*0.5}

NF==2 {
   sub(/[0-9]*_?/," ",$1)
   char[i]=$1 
   print $1 
   tempo[i]=$2
   i++
}

END {
   for(j=2;j<=(i-1);j++) { 
   
      if(freq[char[j]]>=1) {    
         td=dur(tempo[j],tempo[(j-1)])
         med[(j-1)]=media(td,pos[char[j]])
	 pos[char[j]]=med[(j-1)]
	 freq[char[j]]++
      } else { 
	   td=dur(tempo[j],tempo[(j-1)])
	   freq[char[j]]++
	   pos[char[j]]=td
	}  
   }
             
   for(k=2;k<=i;k++) {
   
      if(fr[char[k]]==0) {        
         print char[k] "\t" pos[char[k]]
	 fr[char[k]]++
      }
   }      
}   




