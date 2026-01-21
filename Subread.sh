#!/bin/bash

#SBATCH --job-name=featureCounts
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=4
# number of CPUs to use

#SBATCH --mem=4G
# memory requested for the job

#SBATCH --time=1:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/featureCounts.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/featureCounts.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications


### ENVIRONMENT
# load Subread module
module load Subread

# show loaded modules in log
module list


### VARIABLES
# annotation file in GTF format
gtfFile="/lisc/data/scratch/course/2025w300106/basnet/test.gtf"

# BAM file with aligned reads
bamFile="/lisc/data/scratch/course/2025w300106/basnet/results/map/SRR33559393_Nem_filtered.bam"


### EXECUTION
# run featureCounts to count reads
# use -p for paired-end reads and count one fragment per template
# count only primary alignments
# reverse stranded library
featureCounts -p --countReadPairs -C -T 4 -s 2 --primary \
  -a $gtfFile \
  -o SRR33559393.counts.tsv \
  $bamFile
