#!/bin/bash

#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/featureCounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12448596@unet.univie.ac.at

###ENVIRONMENT
module load Subread
module list

###VARIABLES
gtfFile="/lisc/data/scratch/course/2025w300106/basnet/test.gtf"
bamFile="/lisc/data/scratch/course/2025w300106/basnet/results/map/SRR33559393_Nem_filtered.bam"

###EXECUTION
# run featureCounts to count read
# to use -p for paired ends and count only 1 read per template
# to count only primary alignments
# believe this is a reverse stranded library
featureCounts -p --countReadPairs -C -T 4 -s 2 --primary -a $gtfFile -o SRR33559393.counts.tsv $bamFile

