#!/usr/bin/perl
# calculates compound interest, A=P(1+(r/n)) **(nt)

# get input for Principal
print "Enter Principal: ";
my $p = <STDIN>;
chomp $p; 

# checking validity for p > 0
if ($p < 0) {
  print "Principal can't be less than 0\n";
  while ($p < 0) {
    print "Enter Principal: ";
    $p = <STDIN>;
    chomp $p;
  }
}

# get input for Number of times interest is compounded
print "Enter Number of times interest is compounded: ";
my $n = <STDIN>;
chomp $n;

# checking validity for n = 12, 4, 2, or 1
if ($n == 12 or $n == 4 or $n == 2 or $n == 1) {}
else {
  print "Number of times interest is compounded should be 12, 4, 2, or 1\n";
  while (($n != 12) and ($n != 4) and ($n != 2) and ($n != 1)) {  
    print "Enter Number of times interest is compounded: ";
    $n = <STDIN>;
    chomp $n;
  }
}

# get input for r (interest Rate)
print "Enter Interest Rate (as %): ";
my $r = <STDIN>;
$r = $r *.01;
chomp $r;

# checking validity for 0 < r < 25% or 0 < r < .25 
if ($r <= 0 or $r >= .25) {
  print "Interest rate must be between 0 and 25\n";
  while ($r <= 0 or $r >= .25) {
    print "Enter Interest Rate (as %): ";
    $r = <STDIN>;
    $r = $r *.01;
    chomp $r;
  }
}

# get input for Time of investment
print "Enter Time (in years): ";
my $t = <STDIN>;
chomp $t;

# checking validity for 0 < t < 100 (integers only)
if ($t <= 0 or $t >= 100 or $t !~ /^-?\d+\z/ ) {
  print "Time must be an integer between 0 and 100\n";
  while (($t <= 0 or $t >= 100) or ($t !~ /^-?\d+\z/ )) {
    print "Enter Time (in years): ";
    $t = <STDIN>;
    chomp $t;
  }
}

$a = $p * (1+ ($r/$n)) ** ($n*$t);
printf "Amount is: \$%.2f\n", $a;
