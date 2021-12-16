#!/bin/perl
#push @a,<>;
#chomp @a;
#for $y ( 0 .. $#a ) {
# printf "line %s value %s\n",$y,$a[$y];
#}
while(<>) {
 chomp;
 for $c ( 0 .. length($_)-1 ) {
  $a[$line][$c]=substr($_,$c,1);
 }
 $line++;
}

$line--;
for $y ( 0 .. $line ) {
 #print "y=$y\n";
 for $x ( 0 .. $a[$y]->$#* ) {
  #print "x=$x value=",$a[$y][$x],"\n";
  # test neighbours
  $p=1;
  if($y             && $a[$y][$x] >= $a[$y-1][$x] ) { $p=0 }
  if($x             && $a[$y][$x] >= $a[$y][$x-1] ) { $p=0 }
  if($y<$line       && $a[$y][$x] >= $a[$y+1][$x] ) { $p=0 }
  if($x<$a[$y]->$#* && $a[$y][$x] >= $a[$y][$x+1] ) { $p=0 }
  if($p==1) { 
   $t+=$a[$y][$x] + 1;
  }
 }
}
die $t
