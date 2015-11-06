#!/usr/bin/perl -w
use strict;
use threads;

my @THREADS;

for (my $i=3; $i<=36; $i++) {
    my $exe = "echo -e \"/data/dnasko/phage_proteomic_tree/dnasko/04-clustalw/clustalw.$i\nF\n/data/dnasko/phage_proteomic_tree/dnasko/05-protdist/protdist.$i\ny\" | ~/bin/protdist > /dev/null";
    push (@THREADS, threads->create('task',"$exe"));
}
foreach my $thread (@THREADS) {
    $thread->join();
}


sub task
{
    system( @_ );
}

exit 0;
