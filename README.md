# Phage Proteomic Tree
This is a repository for all of my scripts associated with building the phage proteomic tree -- the overwhelming majority of which are from Rob's rundown, [found here](https://edwards.sdsu.edu/research/how-to-create-a-phage-proteomic-tree/).

[Phage Proteomic Tree paper](http://www.ncbi.nlm.nih.gov/pubmed/12142423).

Helpful directory structure for the analysis:

    lrwxrwxrwx 1 dnasko wommack      31 Nov 29  2014 00-sequences -> ../serc_build_0.1/00-sequences/
    lrwxrwxrwx 1 dnasko wommack      28 Nov 29  2014 01-blastp -> ../serc_build_0.1/01-blastp/
    drwxr-xr-x 2 dnasko wommack 3497984 Nov 29  2014 02-blast_split
    drwxr-xr-x 2 dnasko wommack      88 Dec  1  2014 03-id_map
    drwxr-xr-x 2 dnasko wommack 3235840 Nov 30  2014 04a-dnd
    drwxr-xr-x 2 dnasko wommack 4603904 Nov 30  2014 04-clustalw
    drwxr-xr-x 2 dnasko wommack 4599808 Dec  1  2014 05a-rerun_protdist
    drwxr-xr-x 2 dnasko wommack 4591616 Dec  1  2014 05b-RErerun_protdist
    drwxr-xr-x 2 dnasko wommack 4599808 Dec  1  2014 05-protdist
    drwxr-xr-x 2 dnasko wommack      94 Dec  2  2014 06-matrix
    drwxr-xr-x 2 dnasko wommack      86 Dec  2  2014 07-neighbor
    drwxr-xr-x 2 dnasko wommack      56 Dec  2  2014 08-tree
    lrwxrwxrwx 1 dnasko wommack      26 Nov 29  2014 scripts -> ../serc_build_0.1/scripts/