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

while(<>) {
 @a=split(/ /,$_);
 chomp(@a);

 for $z ( 11 .. 14 ) {
  $v=$a[$z];
  $c++ if(length($v) == 2 || # 1
     length($v) == 3 || # 7
     length($v) == 4 || # 4
     length($v) == 7);  # 8
 }
}
die $c;
