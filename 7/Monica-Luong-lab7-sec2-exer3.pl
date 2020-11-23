#!/usr/bin/perl
# calculates compound interest, A=P(1+r/n) **(nt)
use File::Copy;

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

print "Enter Time (in years): ";
my $t = <STDIN>;
chomp $t;

# checking validity for 0 < t < 100 (integers only)
if ($t <= 0 or $t >= 100 or $t !~ /^-?\d+\z/) {
  print "Time must be an integer between 0 and 100\n";
  while ($t <= 0 or $t >= 100 or $t !~ /^-?\d+\z/) {
    print "Enter Time (in years): ";
    $t = <STDIN>;
    chomp $t;
  }
}

# creating a html file and setting up table's headings
my $file = "compound_interest.html";
open(FILE, ">$file") or die "Couldn't open file $file, $!";

print FILE "<html>\n";
print FILE "<table border>\n";
print FILE "\t<tr>\n";
print FILE "\t\t<th>Counter</th>\n";
print FILE "\t\t<th>Balance Amount</th>\n";
print FILE "\t\t<th>Interest Accrued</th>\n";
print FILE "\t</tr>\n";

close FILE;

# calculating amount by looping
# adding the amount and interest into html fil
for ($count = 0; $count <= $t ; $count = $count + 1) {
  $a = $p * (1+ ($r/$n)) ** ($n*$count);
  $interest = $a - $p;
  open(FILE, ">>$file") or die "Couldn't open file $file, $!";
  print FILE "\t<tr>\n";
  printf FILE "\t\t<td>$count</td>\n";
  printf FILE "\t\t<td>\$%.2f\</td>\n", $a;
  printf FILE "\t\t<td>\$%.2f\</td>\n", $interest;
  print FILE "\t</tr>\n";
  close FILE;
}

# finishing off the html file w/ closing tags
open(FILE, ">>$file") or die "Couldn't open file $file, $!";
print FILE "</table>\n";
print FILE "</html>\n";
close FILE;

# moving the html file into output/ dir
move($file, "output/") or die "Couldn't copy $file into output/ directory, $!";
