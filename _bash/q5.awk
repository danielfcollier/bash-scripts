NF==2 {
   if($1~/[0-9]_./) {
      sub(/_./,"",$1)
      freq[$1]++  
   }   
}
END {
   for(i=0;i<=9;i++) {
      printf "freq[%d]= %d",i,freq[i]
      printf "\n"
   }
}
            