#!/bin/perl

sub max ($$) { $_[$_[0] < $_[1]] }
sub min ($$) { $_[$_[0] > $_[1]] }

$maxx=$maxy=0;
while(<>) {
 ($x1,$y1,$x2,$y2)=/^(\d+),(\d+) -> (\d+),(\d+)/;
 if( &max($x1,$x2) > $maxx) { $maxx=&max($x1,$x2) }
 if( &max($y1,$y2) > $maxy) { $maxy=&max($y1,$y2) }

 # skip diagonals
 next if $x1 != $x2 && $y1 != $y2;
 
 # horizontal
 if($y1==$y2) {
  for $x ( &min($x1,$x2) .. &max($x1,$x2)) { 
   $m[$y1][$x]++; 
  }
 }

 # vertical
 if($x1==$x2) {
  for $y ( &min($y1,$y2) .. &max($y1,$y2)) {
   $m[$y][$x1]++;
  }
 }
 
}

# populate empty cells to aid printing
for $y ( 0 .. $maxy ) {
 for $x ( 0 .. $maxx ) {
  $a++ if $m[$y][$x] > 1;
 }
}
 

# draw
for $y ( 0 .. $maxy ) {
 for $x ( 0 .. $maxx ) {
  print $m[$y][$x] ? $m[$y][$x] : '.';
 }
 print "\n";
}

die $a;
