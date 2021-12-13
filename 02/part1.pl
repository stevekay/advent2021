#!/bin/perl
while(<>) {
 if(/^forward (\d+)/) { $hpos += $1 }
 if(/^down (\d+)/) { $depth+=$1 }
 if(/^up (\d+)/) { $depth-=$1 }
}
print $hpos*$depth,"\n";
