#!/bin/perl

sub max ($$) { $_[$_[0] < $_[1]] }
sub min ($$) { $_[$_[0] > $_[1]] }

$maxx=$maxy=0;
while(<>) {
 ($x1,$y1,$x2,$y2)=/^(\d+),(\d+) -> (\d+),(\d+)/;
 if( &max($x1,$x2) > $maxx) { $maxx=&max($x1,$x2) }
 if( &max($y1,$y2) > $maxy) { $maxy=&max($y1,$y2) }

 $xd=$x1 < $x2 ? 1 : $x1==$x2 ? 0 : -1;
 $yd=$y1 < $y2 ? 1 : $y1==$y2 ? 0 : -1;
 $m[$y1][$x1]++;
 while($x1 != $x2 || $y1 != $y2) {
  $x1+=$xd;
  $y1+=$yd;
  $m[$y1][$x1]++;
 }
}
  
# count
for $y ( 0 .. $maxy ) {
 for $x ( 0 .. $maxx ) {
  $a++ if $m[$y][$x] > 1;
 }
}
 
# draw
#for $y ( 0 .. $maxy ) {
# for $x ( 0 .. $maxx ) {
#  print $m[$y][$x] ? $m[$y][$x] : '.';
# }
# print "\n";
#}

die $a;
