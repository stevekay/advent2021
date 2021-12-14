#!/bin/perl
while(<>) {
 chomp;
 $l=length($_);
 push @a,$_;
}

@co = @a;

# oxy
for $column ( 0 .. $l-1 ) {
 $zeros=0;
 $ones=0;
 for $i ( 0 .. $#a ) {
  if(substr($a[$i],$column,1) == '0') { $zeros++ }
  if(substr($a[$i],$column,1) == '1') { $ones++ }
 }
 $keep = $zeros > $ones ? '0' : '1';
 @newarray=();
 for $line ( 0 .. $#a) {
  $status='keep';
  $status='delete' if substr($a[$line],$column,1) ne $keep;
  if($status eq 'keep') {
   push @newarray,$a[$line];
  }
 }
 @a=@newarray;
 if($#a == 0) {
  $oxy=oct("0b" . $a[0]);
 }
}

# co2 
for $column ( 0 .. $l-1 ) {
 $zeros=0;
 $ones=0;

 for $i ( 0 .. $#co ) {
  if(substr($co[$i],$column,1) == '0') { $zeros++ }
  if(substr($co[$i],$column,1) == '1') { $ones++ }
 }
 $keep = $zeros <= $ones ? '0' : '1';
 @newarray=();
 for $line ( 0 .. $#co) {
  $status='keep';
  $c=substr($co[$line],$column,1);
  if($c ne $keep) {
   $status='delete';
  }
  if($status eq 'keep') {
   push @newarray,$co[$line];
  }
 }
 @co=@newarray;
 if($#co ==0 ) {
  $scrub=oct("0b" . $co[0]);
 }
}
print $oxy * $scrub,"\n";
