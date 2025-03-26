A Nextflow pipeline for identifying 16S rRNA sequences using Barrnap and performing BLAST analysis. 

Overview 
This pipeline performs the following steps: 
Identifies 16S rRNA sequences in genomes using Barrnap 
Extracts the identified 16S sequences 
BLASTs the sequences against a reference database 
Summarizes results into a master summary
 
Requirements

Nextflow (= 21.10.0)
Docker or Singularity (optional but recommended)
NCBI BLAST+ (if not using containers)
Barrnap (if not using containers)
Python with BioPython and Pandas (if not using containers)


Installation 
Clone this repository: git clone https://github.com/yourusername/16S-barrnap-blast.git



