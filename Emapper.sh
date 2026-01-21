#!/bin/bash

#SBATCH --job-name=emapper
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=16
# number of CPUs to use

#SBATCH --mem=32G
# memory requested for the job

#SBATCH --time=12:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/emapper.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/emapper.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications


### ENVIRONMENT
# load eggNOG-mapper module
module load eggnogmapper/2.1.13-foss-2024a

# show loaded modules in log
module list


### VARIABLES
# base directory of the project
path="/lisc/data/scratch/course/2025w300106/basnet"

# directory for eggNOG-mapper output
outDir="${path}/results/emapper_results"


### EXECUTION
# print start time
echo "Started job at $(date)"

# create output directory if needed
mkdir -p ${outDir}

# run eggNOG-mapper on protein fasta file
# use DIAMOND for fast alignment
# keep only experimentally supported GO terms
# use 16 CPUs
# overwrite existing output
emapper.py \
  -i ${path}/proteins.filtered.fasta \
  --go_evidence experimental \
  -o jaNemVect \
  --override \
  --output_dir ${outDir} \
  --cpu 16 \
  --itype proteins \
  -m diamond \
  --evalue 1e-5

# print end time
echo "Job finished at $(date)"
