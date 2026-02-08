#!/bin/bash

#SBATCH --job-name=STAR
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=16
# number of CPUs to use

#SBATCH --mem=20G
# memory requested for the job

#SBATCH --time=12:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/STAR.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/STAR.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications


#This is module needed for Run Code
# load STAR module
module load STAR

# show loaded modules in log
module list


# CODE RUN
# run STAR for paired-end read alignment
# use pre-built genome index
# use 16 threads
# output sorted BAM file
# include strand information for downstream tools
STAR \
  --genomeDir /lisc/data/scratch/course/2025w300106/basnet/Nem_STAR \
  --runThreadN 16 \
  --readFilesIn /lisc/data/scratch/course/2025w300106/basnet/SRR33559393_1.fastq \
                /lisc/data/scratch/course/2025w300106/basnet/SRR33559393_2.fastq \
  --outFileNamePrefix /lisc/data/scratch/course/2025w300106/basnet/results/map/SRR33559393_Nem_ \
  --outSAMstrandField intronMotif \
  --outSAMtype BAM SortedByCoordinate
