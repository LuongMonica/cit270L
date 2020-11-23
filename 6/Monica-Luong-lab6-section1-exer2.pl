#!/usr/bin/perl -w
sub month_array {
  @array = qw/January February March April May June July August September October Novemember December/;
  $len = @array;
  print "\$array[4] = $array[4]\n";
  print "\$array[7] = $array[7]\n";
  print "total # of elements: $len\n";
}
month_array();
