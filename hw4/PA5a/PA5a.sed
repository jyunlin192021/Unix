#!/usr/bin/sed -nf
s/\(....\)/&/;H
s/\(^..\)//p
x;s/\n\(..\).*/\1/;h
x;x;
:J;tJ
s/.\([DHSC]\).\1.\1.\1.\1/Flush/p
s/..\(.\).\1.\1.\1./Four of a kind/p
s/\(.\).\1.\1.\1../Four of a kind/p
d
p