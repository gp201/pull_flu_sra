#!/bin/bash

set -beEu -o pipefail

export PATH=/home/gp/mambaforge/condabin:$PATH

nextflow run https://github.com/gp201/flusra.git -r 'main' -c nextflow.config -profile mamba

mv outputs/fastq/* fastq/

mv outputs/metadata/*.csv metadata/SraRunTable_PRJNA1102327_automated.csv

git config --global user.email "cron@auto.com"
git config --global user.name "Auto"

git add fastq/ metadata/SraRunTable_PRJNA1102327_automated.csv

git commit -m "Automated download of fastq files and metadata for PRJNA1102327"

# discard all changes
git clean -fd
