#!/bin/perl
# Digit Segments
# 0     6
# 1     2
# 2     5
# 3     5
# 4     4
# 5     5
# 6     6
# 7     3
# 8     7
# 9     6
my @segs = ( 'abcefg', # 0
             'cf',     # 1
             'acdeg',  # 2
             'acdfg',  # 3
             'bcdf',   # 4
             'abdfg',  # 5
             'abdefg', # 6
             'acf', # 7
             'abcdefg', # 8
             'abcdfg'); # 9

while(<>) {
 undef %digit;
 undef %seg;
 print "got line $_";
 @a=split(/ /,$_);
 chomp(@a);
 
 @z=@a[0 .. 9];
 undef %m;
 for(@z) {
  $t=join("",sort(split(//,$_)));
  print "t=$t\n";

  $g='';
  if(length($t)==2) {
   $g='1';
   # the two letters here map to c or f
   $m{substr($t,0,1)}='cf';
   $m{substr($t,1,1)}='cf';
  }
  if(length($t)==3) { 
   $g='7';
   $m{substr($t,0,1)}='acf';
   $m{substr($t,1,1)}='acf';
   $m{substr($t,2,1)}='acf';
  }
  if(length($t)==4) { 
   $g='4';
   $m{substr($t,0,1)}='bcdf';
   $m{substr($t,1,1)}='bcdf';
   $m{substr($t,2,1)}='bcdf';
   $m{substr($t,3,1)}='bcdf';
  }
  if(length($t)==7) {
   $g='8';
   $m{substr($t,0,1)}='abcdefg';
   $m{substr($t,1,1)}='abcdefg';
   $m{substr($t,2,1)}='abcdefg';
   $m{substr($t,3,1)}='abcdefg';
   $m{substr($t,4,1)}='abcdefg';
   $m{substr($t,5,1)}='abcdefg';
   $m{substr($t,6,1)}='abcdefg';
  }
  if(length($t)==5) { 
   $g='235';
   $m{substr($t,0,1)}='abdfg';
   $m{substr($t,1,1)}='abdfg';
   $m{substr($t,2,1)}='abdfg';
   $m{substr($t,3,1)}='abdfg';
   $m{substr($t,4,1)}='abdfg';
  }
  if(length($t)==6) {
   $g='069';
   $m{substr($t,0,1)}='abdefg';
   $m{substr($t,1,1)}='abdefg';
   $m{substr($t,2,1)}='abdefg';
   $m{substr($t,3,1)}='abdefg';
   $m{substr($t,4,1)}='abdefg';
   $m{substr($t,5,1)}='abdefg';
  }
  $digit{$t}=$g;
  printf " - got value %-8s : guess is %s\n",$t,$g;
 }

 # dump what we know
 foreach (sort keys %digit) {
  printf "  %-8s %-8s %s\n",$_,$digit{$_},$segs[$digit{$_}];
 }
 print "mappings\n";
 foreach (sort keys %m) {
  printf "  %s -> %s\n",$_,$m{$_};
 }
 exit;

 print "\n";
 for $z ( 11 .. 14 ) {
  $t=join("",sort(split(//,$a[$z])));
  printf "digit to decode = %s, which is %s\n",$t,$digit{$t};
 }
}
