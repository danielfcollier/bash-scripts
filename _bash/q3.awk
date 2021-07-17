NF==2 {
   a[i]=$2
   i++
}
END {
   r=(a[(i-1)]-a[1])/(i-1)
   printf "%f\n",r
}
