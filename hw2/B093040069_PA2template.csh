#!/usr/bin/tcsh
cd $1
ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1
( fgrep 5 ___tempfile1 >& /dev/null ) && echo Flush!
ls [2-9]? | cut -c 1 > faces
ls [TJQKA]? |& fgrep -v : | cat -n | tr 'TJQKA\t' '012341' | cut -c 7,8 >> faces
uniq -c faces | sort | cut -c 7 > facecounts
( expr `cat facecounts | wc -w ` == 4 > ___tempfile4 ) && echo One pair!
( expr `cat facecounts | wc -w ` == 3 > ___tempfile4 ) && ( fgrep 2 facecounts > ___tempfile4 ) && echo Two pair!
( expr `cat facecounts | wc -w ` == 3 > ___tempfile4 ) && ( fgrep 3 facecounts > ___tempfile4 ) && echo Three of a kind!
( expr `cat facecounts | wc -w ` == 2 > ___tempfile4 ) && ( fgrep 4 facecounts > ___tempfile4 ) && echo Four of a kind!
(expr `cat facecounts | wc -w` == 2 > ___tempfile4) && (fgrep 3 facecounts > ___tempfile4) && echo Full house!
( expr `sort -n faces | tail -1` - `sort -n faces | head -1` == 4 > ___tempfile4 ) && (  expr `cat facecounts | wc -w` == 5 > ___template4 ) && echo Straight!
( expr `head -1 faces` - `head -n 4 faces | tail -n 1` == -3 > ___tempfile4) && ( expr `tail -1 faces` - `head -1 faces` == 12 > ___tempfile4 ) && echo Straight!
