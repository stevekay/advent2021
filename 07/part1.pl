#!/bin/perl
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
 $tot=0;
 for $x ( 0 .. $#a ) {
  $v=$a[$x];
  if($v < $dest) { $tot += $dest-$v }
  if($v > $dest) { $tot += $v-$dest }
 }
 if($tot < $minfuel) { $minfuel=$tot }
}
die $minfuel;
