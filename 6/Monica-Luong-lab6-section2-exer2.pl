#!/usr/bin/perl
$str1 = "This is String One";
@array = split(' ', $str1);
splice(@array,2,1,"Act");
$str2 = join(' ',@array);

print "Original string: $str1\n";
print "Array: @array\n";
print "Transformed string: $str2\n";
