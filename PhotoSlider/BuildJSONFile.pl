#!/usr/bin/perl
use strict;
use warnings;
use JSON;

my $dir = "gallery";

opendir(my $dh, $dir) or die "Can't open $dir: $!";
my @files = grep { /\.(jpe?g)$/i } readdir($dh);
closedir($dh);

# Pretty JSON encoder
my $json = JSON->new->pretty->canonical(0);

open(my $out, ">", "./photos.json") or die "Can't write photos.json: $!";
print $out $json->encode(\@files);
close($out);

print "photos.json created with ", scalar(@files), " images\n";