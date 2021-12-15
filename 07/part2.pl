#!/bin/perl

# works, but is very slow.  produce a factorial lookup table instead of calcing each time ?

@a=split(/,/,<>);
chomp(@a);
$min=9e9;
$max=-1;
for $x ( 0 .. $#a ) {
 $v=$a[$x];
 if($v < $min) { $min=$v } 
 if($v > $max) { $max=$v } 
}

$minfuel=9e9;
for $dest ( $min .. $max ) {
 if($dest % 10 == 0) { print scalar localtime," doing dest $dest\n" }
 $tot=0;
 for $x ( 0 .. $#a ) {
  $v=$a[$x];
  $p=0;
  if($v < $dest) {
   for($z=1;$z<=$dest-$v;$z++) { $p+=$z }
   $tot += $p
  }
  if($v > $dest) {
   for($z=1;$z<=$v-$dest;$z++) { $p+=$z }
   $tot += $p;
  }
 }
 if($tot < $minfuel) { $minfuel=$tot }
}
die $minfuel;
