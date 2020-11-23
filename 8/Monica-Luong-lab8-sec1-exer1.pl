#!/usr/bin/perl
# Gets server log & generates a report that counts:
#   -errors in each month
#   -errors in each php file

# get input for server log file
print "Enter the server log file you want to generate a report for: ";
my $log = <STDIN>;
chomp $log;

# setup count for each month
my $janCount = 0; my $febCount = 0; my $marCount = 0; my $aprCount = 0; my $mayCount = 0; my $junCount = 0; my $julCount = 0; my $augCount = 0; my $sepCount = 0; my $novCount = 0; my $decCount = 0;
# setup hash var that'll hold php filenames and count
my %php = ();

# open inputted server log file
# if regex matches to certain month, increment the count of that month
# also tallies up count per php file
open(DATA, "<$log") or die "Couldn't open log file $log, $!";
while (<DATA>) {
  my $string = $_;
  if ($string =~ m/J(an?)/gi) { $janCount = $janCount + 1; }
  elsif ($string =~ m/F(eb?)/gi) { $febCount = $febCount + 1; }
  elsif ($string =~ m/M(ar?)/gi) { $marCount = $marCount + 1; }
  elsif ($string =~ m/A(pr?)/gi) { $aprCount = $aprCount + 1; }
  elsif ($string =~ m/M(ay?)/gi) { $mayCount = $mayCount + 1; }
  elsif ($string =~ m/J(un?)/gi) { $junCount = $junCount + 1; }
  elsif ($string =~ m/J(ul?)/gi) { $julCount = $julCount + 1; }
  elsif ($string =~ m/A(ug?)/gi) { $augCount = $augCount + 1; }
  elsif ($string =~ m/S(ep?)/gi) { $sepCount = $sepCount + 1; }
  elsif ($string =~ m/O(ct?)/gi) { $octCount = $octCount + 1; }
  elsif ($string =~ m/N(ov?)/gi) { $novCount = $novCount + 1; }
  elsif ($string =~ m/D(ec?)/gi) { $decCount = $decCount + 1; }
  my $line =$_;
  if ($line =~ m/\/var\/www\/html\/.+\.php/gi) { 
    if (exists $php{$&}) { $php{$&} = $php{$&} + 1; }
    else { $php{$&} = 1; }
  } 
}
close $log;

# create "report.txt" which prints out the 
#   -error count for each month (if > 0)
#   -error count for each php file
my $file = "report.txt";
open(DATA, ">$file") or die "Couldn't open file $file, $!";
print DATA "Error count for each month:\n";
if ($janCount > 0) { print DATA "Jan: $janCount\n";}
if ($febCount > 0) { print DATA "Feb: $febCount\n";}
if ($marCount > 0) { print DATA "Mar: $marCount\n";}
if ($aprCount > 0) { print DATA "Apr: $aprCount\n";}
if ($mayCount > 0) { print DATA "May: $mayCount\n";}
if ($junCount > 0) { print DATA "Jun: $junCount\n";}
if ($julCount > 0) { print DATA "Jul: $julCount\n";}
if ($augCount > 0) { print DATA "Aug: $augCount\n";}
if ($sepCount > 0) { print DATA "Sep: $sepCount\n";}
if ($octCount > 0) { print DATA "Oct: $octCount\n";}
if ($novCount > 0) { print DATA "Nov: $novCount\n";}
if ($decCount > 0) { print DATA "Dec: $decCount\n";}
print DATA " \n";
print DATA "Error count for each php page:\n";
for (keys %php) { print DATA "$_: $php{$_}\n"; }
close $file;

print " \n";
print "Report generated. Do \"cat report.txt\" to see the report\n";
