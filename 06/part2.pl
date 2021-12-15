#!/bin/perl
$_=<>;
while(/(\d+)/g) {
 $a[$1]++;
}

while($day++ < 256) {
 $xx = $a[0];
 $a[0] = $a[1];
 $a[1] = $a[2];
 $a[2] = $a[3];
 $a[3] = $a[4];
 $a[4] = $a[5];
 $a[5] = $a[6];
 $a[6] = $xx + $a[7];
 $a[7] = $a[8];
 $a[8] = $xx ;
}

# work out total
for $z ( 0 .. 8 ) {
 $tot += $a[$z];
}
die $tot;
