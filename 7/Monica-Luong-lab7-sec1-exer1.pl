#!/usr/bin/perl
print "Enter Principal: ";
my $p = <STDIN>;
chomp $p; 

print "Enter Number of times interest is compounded: ";
my $n = <STDIN>;
chomp $n;

print "Enter Interest Rate (as %): ";
my $r = <STDIN>;
$r = $r *.01;
chomp $r;

print "Enter Time (in years): ";
my $t = <STDIN>;
chomp $t;

$a = $p * (1+ ($r/$n)) ** ($n*$t);
printf "Amount is: \$%.2f\n", $a;
