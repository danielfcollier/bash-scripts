NF==2 {
   a[i]=$2
   
   if($1~/.*[aAeEiIoOuU].*/)
      x++
   if(x==1) {
      b[j]=(a[i]-a[(i-1)])
      x=0
      j++
   }   
   i++
   
}
END {
   for(k=1;k<=(j-1);k++) {
      r=b[k]  
      printf "%f\n", r
   }   
}
      