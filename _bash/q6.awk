NF>=3 {
   if ($3 ~ /[aAeEiIoOuU]./) {
      
      sub(/[^aAeEiIoOuU]/," ",$3)
      freq[$3]++
   }
}
END {
   for (i in freq) {  
      print "freq["i"] =" freq[i]  
      printf "\n"   
   }         
}


      
   
      