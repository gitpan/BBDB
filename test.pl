# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use BBDB;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.


my $all = BBDB::simple("sample_data.bbdb");
print "not " unless @$all == 2;
print "ok 2\n";

print "not " unless $all->[0]->part('last') eq "last name";
print "ok 3\n";

print "not " unless @{$all->[1]->part('net')} == 2;
print "ok 4\n";

for ($i=0; $i<2; $i++) {
  my $a = $all->[$i];
  my $b = new BBDB;
  $b->decode($a->encode());
  print "not " unless $a->encode() eq $b->encode();
  printf "ok %d\n",5+$i;
}
