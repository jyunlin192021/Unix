#!/usr/bin/csh
set face = ( 0 0 0 0 0 0 0 0 0 0 0 0 0 )
set suit = ( 0 0 0 0 )
set element = ( ♦ ♥ ♠ ♣ )
foreach i ( `seq 51 | sort -R | head -5 | sort -gk1 ` )
   @ a = `expr $i / 13 + 1`
   @ b = `expr $i % 13 + 1`
   echo -n \  `echo $b | grep "1." | cut -c 2 | tr "0123" "JQKA" || expr $b + 1`$element[$a]
   @ face[$b] = `expr $face[$b] + 1`
   @ suit[$a] = `expr $suit[$a] + 1`
end
echo -n ": "
switch ( `echo $face | tr " " "\n" | sort -r | tr -d "0\n"` )
  case 41:
      echo Four of a kind! ;breaksw
  case 32:
      echo Full house! ;breaksw
  case 311:
      echo Three of a kind! ;breaksw
  case 221:
      echo Two pair! ;breaksw
  case 2111:
      echo One pair! ;breaksw
  case 11111:

      set flush = ""
      if ( $suit[1] == 5 || $suit[2] == 5 || $suit[3] == 5 || $suit[4] == 5 ) set flush = \ Flush!
      if ( `echo $face` =~ '*1 1 1 1 1*') then
          echo Straitht$flush!
      else if ( `echo $face[13] $face[1] $face[2] $face[3] $face[4]` == '1 1 1 1 1' ) then
          echo Straight$flush!
      else if ( $flush != "" ) then
          echo Flush!
      else
          foreach i ( `seq 13 | sort -gr` )
	     if ( $face[$i] == 1 ) then
                
		switch ($i)
		    case 13 :
		        echo Ace high!
			exit
		    case 12 :
		        echo King high!
			exit
		    case 11 :
		        echo Queen high!
			exit
		    case 10 :
		        echo Jack high!
			exit
		    default :
		        echo `expr $i + 1` high!
			exit
		 endsw
	     endif
          end
      endif
  endsw   
		 
          
