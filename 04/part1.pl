#!/bin/perl

# read numbers
@num=split(/,/,<>);

sub DisplayCards() {
 for $a ( 0 .. $#card) {
  print "Card $a\n";
  for $b ( 0 .. $card[$a]->$#* ) {
   printf " ele %02d val %s\n",$b,$card[$a][$b];
  }
 }
}

sub NiceDisplayCards() {
 for $a ( 0 .. $#card) {
  print "\nCard $a\n";
  for $b ( 0 .. 4 ) {
   printf "  %2d%1s %2d%1s %2d%1s %2d%1s %2d%1s\n",
    $card[$a][$b*5+0],
    $drawn{$card[$a][$b*5+0]},
    $card[$a][$b*5+1],
    $drawn{$card[$a][$b*5+1]},
    $card[$a][$b*5+2],
    $drawn{$card[$a][$b*5+2]},
    $card[$a][$b*5+3],
    $drawn{$card[$a][$b*5+3]},
    $card[$a][$b*5+4],
    $drawn{$card[$a][$b*5+4]};
  }
 }
}
  
# read cards
$c=-1;
while(<>) {
 if(/^$/) { $c++ }

 while(/(\d+)/g) {
#  print " -> $1\n";
  push @{$card[$c]},$1;
 } 
 
}


#&DisplayCards;

&NiceDisplayCards;

for(@num) {
 print "drew number $_\n";
 $drawn{$_}='*';
 &NiceDisplayCards;

 # check for winner
print "checking for winner....\n";
 for $a ( 0 .. $#card) {
  print "\nCard $a\n";
  @coltots=();
  for $b ( 0 .. $card[$a]->$#* ) {

   $v=$card[$a][$b];

   # check for winning row
   if($b % 5 == 0) { $rowtot=0 }
   $row=int($b/5);
   #printf "row=%d %02d=%02d ",$row,$b,$v;
   if($drawn{$v} eq '*') { $rowtot++ }
   if($rowtot==5) { 
    print "winner!\n"; 

    # find sum of all numbers on this card
    $tot=0;
    for $z ( 0 .. 24 ) {
     #print " -> ",$card[$a][$z],"\n";
     $v=$card[$a][$z];
     if($drawn{$v} ne '*') { $tot+=$v }
    }
    print $tot * $_,"\n";
    exit;
   }

   # check for winning column
   $column=$b % 5;
   if($drawn{$v} eq '*') { $coltots[$column]++ }
  }
  for $zz ( 0 .. 4 ) {
   printf "column %d total %d\n",$zz,$coltots[$zz];
   if($coltots[$zz] == 5) {
    print "vertical winner!\n";
    $tot=0;
    for $z ( 0 .. 24 ) {
     #print " -> ",$card[$a][$z],"\n";
     $v=$card[$a][$z];
     if($drawn{$v} ne '*') { $tot+=$v }
    }
    print $tot * $_,"\n";
    exit;
   }
  }
  print "\n";
 }
 print "    \n";
}
