#!/usr/bin/perl
use File::Copy;
$dir = "./output";
mkdir($dir) or die "Couldn't create $dir directory, $!";
copy("lab7.txt", "output/") or die "Couldn't copy lab7.txt into $dir directory, $!";
