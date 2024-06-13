#!/bin/bash

set -beEu -o pipefail

nextflow run https://github.com/gp201/flusra.git -r 'main' -c nextflow.config -profile mamba

mv output/fastq/* fastq/

mv output/metadata/*.csv metadata/SraRunTable_PRJNA1102327_automated.csv

git add fastq/ metadata/SraRunTable_PRJNA1102327_automated.csv

git commit -m "Automated download of fastq files and metadata for PRJNA1102327"

# discard all changes
git clean -fd
