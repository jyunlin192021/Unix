#!/usr/bin/csh
set face = ( 0 0 0 0 0 0 0 0 0 0 0 0 0 )
set suit = ( 0 0 0 0 )
set element = ( ♦ ♥ ♠ ♣ )
foreach i ( `seq 51 | sort -R | head -5 | sort -n ` )
   @ a = `expr $i / 13 + 1`
   @ b = `expr $i % 13 + 1`
   echo -n \  `echo $b | grep "1." | cut -c 2 | tr "0123" "JQKA" || expr $b + 1`$element[$a]
   @ face[$b] = `expr $face[$b] + 1`
   @ suit[$a] = `expr $suit[$a] + 1`
end
