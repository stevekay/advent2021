#!/bin/perl
while(<>) {
 $c++ if $_ > $last;
 $last=$_;
}
print $c-1,"\n";
