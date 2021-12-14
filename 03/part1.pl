#!/bin/perl
while(<>) {
 $l=length($_)-1;
 for $i (0..length($_)-2) {
  $v{$i}{substr($_,$i,1)}++;
 }
}
for $z ( 0 .. $l-1 ) {
 $gamma .= $v{$z}{0} > $v{$z}{1} ? "0" : "1";
 $epsilon .= $v{$z}{0} > $v{$z}{1} ? "1" : "0";
}
print oct("0b$gamma") * oct("0b$epsilon"),"\n";
