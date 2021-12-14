#!/bin/perl
while(<>) {
 if(/^down (\d+)/) { $aim+=$1 }
 if(/^up (\d+)/) { $aim-=$1 }
 if(/^forward (\d+)/) { $hpos += $1 ; $depth+=$aim*$1}
}
print $hpos*$depth,"\n";
