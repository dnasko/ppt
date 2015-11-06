#!/usr/bin/perl -w
use strict;

my $fasta = $ARGV[0];
my $btab  = $ARGV[1];
my %gene;
my %taxa;
my %blast;
my %blast_count;

open(IN,"<$fasta") || die "\n Cannot open the file: $fasta\n";
while(<IN>) {
    chomp;
    if ($_ =~ m/^>/) {
	my $line = $_;
	$line =~ s/^>//;
	my $taxa = $line;
	$taxa =~ s/.*\[//;
	$taxa =~ s/].*//;
	my $gene = $line;
	$gene =~ s/ .*//;
	$gene{$gene} = $taxa;
	$taxa{$taxa}++;
    }
}
close(IN);

# open(IN,"<$btab") || die "\n $btab\n";
# while(<IN>) {
#     my @a = split(/\t/, $_);
#     if (exists $gene{$a[0]} && exists $gene{$a[1]}) {
# 	$blast_count{$gene{$a[0]}}{$gene{$a[1]}}++;
#     }
#     else {
# 	die " missing: $a[0]\t\t $a[1]\n\n";
#     }
# }
# close(IN);

open(IN,"<$btab") || die "\n $btab\n";
while(<IN>) {
    my @a = split(/\t/, $_);
    $blast{$a[0]}{$a[1]} = 1;
}
close(IN);

foreach my $i (keys %blast) {
    foreach my $j (keys %{$blast{$i}}) {
        if (exists $gene{$i} && exists $gene{$j}) {
	    $blast_count{$gene{$i}}{$gene{$j}}++;
        }
        else {
            die " missing: $i\t\t $j\n\n";
        }
    }
}

foreach my $i (keys %blast_count) {
    foreach my $j (keys %{$blast_count{$i}}) {
	if (exists $taxa{$i} && exists $taxa{$j}) {
	    my $sum = $taxa{$i} + $taxa{$j};
	    my $combine = $blast_count{$i}{$j};
	    if (exists $blast_count{$j}{$i}) {
		$combine += $blast_count{$j}{$i};
	    }
	    my $dist = $combine / $sum;
	    $dist = 1 - $dist;
	    print "$i\t$j\t$blast_count{$i}{$j}\t$dist\n";
	}
	else {
	    die "\n Cannot find: $taxa{$i} &&exists $taxa{$j}\n";
	}
    }
}

exit 0;
