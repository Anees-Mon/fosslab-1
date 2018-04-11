#!/usr/bin/perl
open(FILE, "hello.txt") or die "Could not open file:$!";
my ($chars)= (0);

while (<FILE>){
	$chars += length($_);
}
print( "Characters=$chars\n");
