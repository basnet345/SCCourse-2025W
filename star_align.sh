#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/STAR.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12448596@unet.univie.ac.at

###ENVIRONMENT
module load STAR
module list

###EXECUTION
STAR --genomeDir /lisc/data/scratch/course/2025w300106/basnet/Nem_STAR --runThreadN 16 --readFilesIn /lisc/data/scratch/course/2025w300106/basnet/SRR33559393_1.fastq /lisc/data/scratch/course/2025w300106/basnet/SRR33559393_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/basnet/results/map/SRR33559393_Nem_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate




