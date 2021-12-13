#!/bin/perl
while(<>) {
 chomp;
 $tot=$minusone+$minustwo+$_;
 if($minusone && $minustwo) {
  $count++ if $tot > $prevtot && $prevtot;
  $prevtot=$tot;
 }
 $minustwo=$minusone;
 $minusone=$_;
}
print "$count\n";
