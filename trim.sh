#!/bin/bash

#SBATCH --job-name=trimmomatic
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=4
# number of CPUs to use

#SBATCH --mem=16G
# memory requested for the job

#SBATCH --time=4:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/trimmomatic.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/trimmomatic.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications

# load Trimmomatic module
module load Trimmomatic

# show loaded modules in log
module list

# base working directory
wd="/lisc/data/scratch/course/2025w300106/basnet"

# output directory for trimmed reads
outDir="$wd/results/trimmomatic"

# print start time
echo "Started job at $(date)"

# create output directory if needed
mkdir -p $outDir

# run Trimmomatic in paired-end mode
# use 4 threads
# write trimming summary file
# remove Illumina adapter sequences
# trim reads using sliding window quality filter
# discard reads shorter than 75 bp
trimmomatic PE \
  -threads 4 \
  -summary $outDir/SRR33559393_summary.txt \
  $wd/SRR33559393_1.fastq \
  $wd/SRR33559393_2.fastq \
  -baseout $outDir/SRR33559393_ \
  ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 \
  SLIDINGWINDOW:4:20 \
  MINLEN:75

# print end time
echo "Job finished at $(date)"
