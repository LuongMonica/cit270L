#!/usr/bin/perl -w
open(DATA, "<lab7.txt") or die "Couldn't open file lab7.txt, $!";
my @reverse_lines = reverse <DATA>;
print "$reverse_lines[0]";
print "$reverse_lines[1]";
print "$reverse_lines[2]";
print "$reverse_lines[3]";
print "$reverse_lines[4]";
