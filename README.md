16S rRNA Identification and BLAST Pipeline
A Nextflow pipeline for identifying 16S rRNA sequences from genome assemblies using Barrnap, followed by BLAST+ analysis and summarization of results.

Overview
This pipeline automates the following steps:

16S rRNA Detection
Uses Barrnap to identify 16S rRNA regions in input genome assemblies.

Sequence Extraction
Extracts the identified 16S sequences from each genome.

BLAST Analysis
Runs BLAST against a user-provided 16S reference database.

Result Summarization
Generates a comprehensive summary report of the top BLAST hits per sample.

 
Requirements

Nextflow (= 21.10.0)
NCBI BLAST+ (if not using containers)
Barrnap (if not using containers)


Installation 
Clone this repository: git clone https://github.com/winniendy/Turnip-16s.git


For how to make database for blast+, read build_blastdb.md
