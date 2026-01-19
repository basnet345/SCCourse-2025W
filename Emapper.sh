#!/bin/bash

#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/emapper.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/emapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12448596@unet.univie.ac.at

### ENVIRONMENT
module load eggnogmapper/2.1.13-foss-2024a
module list

### VARIABLES
path="/lisc/data/scratch/course/2025w300106/basnet"
outDir="${path}/results/emapper_results"

### EXECUTION
echo "Started job at $(date)"
mkdir -p ${outDir}

emapper.py -i ${path}/proteins.filtered.fasta --go_evidence experimental -o jaNemVect --override --output_dir $outDir  --cpu 16 --itype proteins -m diamond --evalue 1e-5

echo "Job finished at $(date)"
