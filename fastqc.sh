#!/bin/bash

#SBATCH --job-name=fastqcR
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=26
# number of CPUs requested

#SBATCH --mem=2G
# memory requested for the job

#SBATCH --time=12:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/fastqc.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/fastqc.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications

# load FASTQC module
module load FASTQC
# output directory for FastQC results
outDir="/lisc/data/scratch/course/2025w300106/basnet/results/fastqc"

# directory containing input FASTQ files
readsDir="/lisc/data/scratch/course/2025w300106/basnet"


### EXECUTION
# print start time
echo "Started job at $(date)"

# create output directory
mkdir $outDir

# run FastQC on paired-end reads
# use 2 threads
# write results to output directory
fastqc -t 2 -o $outDir \
  $readsDir/SRR33559393_1.fastq \
  $readsDir/SRR33559393_2.fastq

# print end time
echo "Job finished at $(date)"
