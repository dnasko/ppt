#PBS -N proteomic_tree
#PBS -S /bin/bash
#PBS -V
#PBS -l walltime=2:00:00,cput=2:00:00,nodes=biohen36:ppn=1
#PBS -t 1001-5000

cd /data/dnasko/phage_proteomic_tree/serc_build_0.00001
touch outfile
echo -e "/data/dnasko/phage_proteomic_tree/serc_build_0.00001/04-clustalw/clustalw.$PBS_ARRAYID\nF\n/data/dnasko/phage_proteomic_tree/serc_build_0.00001/05-protdist/protdist.$PBS_ARRAYID\ny" | /home/dnasko/bin/protdist > /dev/null