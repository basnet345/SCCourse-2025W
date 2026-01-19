#!/bin/bash

#SBATCH --job-name=fastqcR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=26
#SBATCH --mem=2G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/fastqc.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12448596@unet.univie.ac.at


###ENVIRONMENT
module load FASTQC

###VARIABLES
outDir="/lisc/data/scratch/course/2025w300106/basnet/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/basnet"

###EXECUTION
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/SRR33559393_1.fastq $readsDir/SRR33559393_2.fastq
echo "Jobfinished at $(date)"
