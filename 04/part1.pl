#!/bin/perl

# read numbers
@num=split(/,/,<>);

# read cards
$c=-1;
while(<>) {
 $c++ if /^$/;
 while(/(\d+)/g) {
  push @{$card[$c]},$1;
 } 
}

for(@num) {
 $drawn{$_}='*';

 for $a ( 0 .. $#card) {
  @coltots=();
  for $b ( 0 .. $card[$a]->$#* ) {

   $v=$card[$a][$b];

   # check for winning row
   if($b % 5 == 0) { $rowtot=0 }
   $row=int($b/5);
   if($drawn{$v} eq '*') { $rowtot++ }
   if($rowtot==5) { 
    for $z ( 0 .. 24 ) {
     $v=$card[$a][$z];
     if($drawn{$v} ne '*') { $tot+=$v }
    }
    die $tot * $_;
   }

   # check for winning column
   if($drawn{$v} eq '*') { $coltots[$b % 5]++ }
  }
  for $zz ( 0 .. 4 ) {
   if($coltots[$zz] == 5) {
    for $z ( 0 .. 24 ) {
     $v=$card[$a][$z];
     if($drawn{$v} ne '*') { $tot+=$v }
    }
    die $tot * $_;
   }
  }
 }
}
