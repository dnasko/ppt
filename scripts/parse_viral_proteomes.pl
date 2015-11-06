#!/usr/bin/perl -w
use strict;

my $infile = $ARGV[0];
my $print_flag = 0;
my %hash;

open(IN,"<$infile") || die "\n Cannot open the fasta: $infile\n";
while(<IN>) {
    chomp;
    if ($_ =~ m/^>/) {
	$print_flag = 0;
	my $line = $_;
	$line =~ s/^>//;
	my $gi = $line;
	$gi =~ s/ .*//;
	my $taxa = $line;
	$taxa =~ s/.*\[//;
	$taxa =~ s/]//;
	if ($taxa =~ m/phage/i) {
	    print STDOUT $_ . "\n";
	    $print_flag = 1;
	    $hash{$taxa}++;
	}
    }
    elsif ($print_flag == 1) {
	print STDOUT $_ . "\n";
    }
}
close(IN);

# foreach my $i (keys %hash) {
#     foreach my $j (keys %{$hash{$i}}) {
# 	print STDERR $i . "\t" . $j . "\t" . $hash{$i}{$j} . "\n";
#     }
# }

foreach my $i (keys %hash) {
    print STDERR $i . "\t" . $hash{$i} . "\n";
}

exit 0;
