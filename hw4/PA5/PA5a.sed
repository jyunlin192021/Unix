#!/usr/bin/sed -nf
s/\(.*\)/&/;H
s/\(^..\)//p
x;s/\n\(..\).*/\1/;h
x;
:J;tJ
s/.\([CDHS]\).\1.\1.\1.\1/Flush!/p
s/..\(.\).\1.\1.\1./Four of a kind!/p
s/\(.\).\1.\1.\1.../Four of a kind!/p
/........../!d
/Flush!/q
/Four of a kind!/q
s/\(..\)/\1\n/g
s/.\n//g
/\(.\)\1\1/!b not3identical
/^\([1-9AJKQT]\)\1\1*\([1-9AJKQT]\)\2\2*/c Full house!
/.*\([1-9AJKQT]\)\1\1.*/c Three of a kind
:not3identical
/\(.\)\1/!b not2identical
/.*\([1-9AJKQT]\)\1.*\([1-9AJKQT]\)\2.*/c Two pair!
/.*\([1-9AJKQT]\)\1.*.*/c One pair!
:not2identical
s/.*/&_23456789T/
/[23456][34567][45678][56789][6789T]_23456789T/c Straight
/2345A_23456789T/c Straight
/[9A]JKQT_23456789T/c Straight
/89JQT_23456789T/c Straight
/789JT_23456789T/c Straight
/....._23456789T/c Nothing