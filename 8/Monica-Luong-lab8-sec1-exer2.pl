#!/usr/bin/perl
# this script gets name of a server log file, 
# reads it and censors the first 3 segments of all IP addrs
# i.e: 123.4.56.78 --> xxx.xxx.xxx.78

use File::Copy;

# get input for server log file
print "Enter the server log file you want to censor the IP addresses of: ";
my $log = <STDIN>;
chomp $log;

# read inputted server log file,
# create temp file that's a copy of inputted file,
# mask the first 3 segments of all IP addrs in temp file
open my $in,  '<',  $log     or die "Can't read old file: $!";
open my $out, '>', "$log.temp" or die "Can't write new file: $!";

while( <$in> ) {
    s/\b(\d{1,3}\.){3}\b/xxx.xxx.xxx./g;
    print $out $_;
}
close $out;

# get rid of temp file, rename it to the original log file
move("$log.temp", "$log");

print " \n";
print "Now do \"cat $log\" to see that your log file has all the IP addresses censored\n";
