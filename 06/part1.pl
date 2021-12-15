#!/bin/perl
@a=split(/,/,<>);
chomp(@a);
$day=0;
while($day < 80) {
 for $x ( 0 .. $#a) {
  $a[$x]--;
  if($a[$x]==-1) { $a[$x]=6 ; push @a,"8" }
 }
 $day++;
}

die $#a + 1;
