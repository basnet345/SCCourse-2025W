#!/bin/bash

#SBATCH --job-name=cellranger
# name of the job

#SBATCH --nodes=1
# request one node

#SBATCH --cpus-per-task=16
# number of CPUs to use

#SBATCH --mem=64G
# memory requested for the job

#SBATCH --time=12:00:00
# maximum run time

#SBATCH --output=/lisc/data/scratch/course/2025w300106/basnet/logs/cellranger.%j.log
# file to write standard output
# %j is the job ID

#SBATCH --error=/lisc/data/scratch/course/2025w300106/basnet/logs/cellranger.%j.err
# file to write error messages

#SBATCH --mail-type=END,FAIL
# send email when job ends or fails

#SBATCH --mail-user=a12448596@unet.univie.ac.at
# email address for notifications


### ENVIRONMENT
# load CellRanger module
module load CellRanger

# show loaded modules in log
module list


### VARIABLES
# base project directory
path="/lisc/data/scratch/course/2025w300106"

# reference transcriptome index
index="${path}/common/NV2_fluo"

# directories containing FASTQ files (multiple runs)
fastq_dir="${path}/common/blastula.12h/run1,${path}/common/blastula.12h/run2,${path}/common/blastula.12h/run3"

# sample name used by CellRanger
sample="89085"

# output directory for CellRanger results
outDir="${path}/basnet/results/cellranger"

# CellRanger run ID
id="blastula_12h"


### EXECUTION
# print start time
echo "Started job at $(date)"

# create output directory if needed
mkdir -p $outDir

# move into output directory
cd ${outDir}

# run CellRanger count
# use provided transcriptome index
# process FASTQ files from multiple runs
# force cell number to 10,000
# skip secondary analysis
# use 16 local cores
# do not create BAM file
cellranger count \
  --transcriptome $index \
  --fastqs $fastq_dir \
  --sample $sample \
  --force-cells 10000 \
  --nosecondary \
  --localcores 16 \
  --id $id \
  --create-bam false

# print end time
echo "Job finished at $(date)"
