#!/usr/bin/perl
$str1 = "\"This is String One\"";
$str2 = "\"This is String Two\"";
$str3 = $str1 . $str2;

$len1 = length($str1);
$len2 = length($str2);
$len3 = length($str3);

print "$str1, length: $len1\n";
print "$str2, length: $len2\n";
print "$str3, length: $len3\n";
