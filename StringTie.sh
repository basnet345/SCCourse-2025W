#!/bin/bash

#SBATCH --job-name=stringtie
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=5
# number of CPUs to use

#SBATCH --mem=5G
# memory requested for the job

#SBATCH --time=1:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/stringtie.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/stringtie.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications


### ENVIRONMENT
# load StringTie module
module load StringTie

# show loaded modules in log
module list


### VARIABLES
# base directory of the project
path="/lisc/data/scratch/course/2025w300106/basnet"

# input BAM file with aligned reads
inBam="$path/results/map/SRR33559393_Nem_Aligned.sortedByCoord.out.bam"

# output directory for StringTie results
outDir="$path/results/StringTie"


### EXECUTION
# print start time
echo "Started job at $(date)"

# create output directory if needed
mkdir -p $outDir

# run StringTie for transcript assembly
# label transcripts with sample name
# use 4 threads
# require minimum junction coverage
# minimum gap and transcript length thresholds
stringtie $inBam \
  -l Nem \
  -o $outDir/bioDataAnalysis_Nem.gtf \
  -p 4 \
  -j 5 \
  -g 200 \
  -m 200

# print end time
echo "Job finished at $(date)"
