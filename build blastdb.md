1. Download a Database from NCBI

Go to your BLAST database folder:
cd /path/to/blastdb

Download the database files (.tar.gz) from the NCBI FTP site:
https://ftp.ncbi.nlm.nih.gov/blast/db/

Example:
wget https://ftp.ncbi.nlm.nih.gov/blast/db/16S_ribosomal_RNA.tar.gz
tar -xvzf 16S_ribosomal_RNA.tar.gz

Update the params.yaml file with the full path to the database (no file extension):
blast_db: "/path/to/blastdb/16S_ribosomal_RNA"

2. Make Your Own BLAST Database

Prepare a FASTA file with your reference sequences
Example: ref_sequences.fasta

Build the database:
makeblastdb -in ref_sequences.fasta -dbtype nucl -out ref_db

Options:

-in: input FASTA file

-dbtype: type of sequences (nucl for nucleotide, prot for protein)

-out: prefix for output database files

This will generate files like:

ref_db.nhr
ref_db.nin
ref_db.nsq

Update the params.yaml file with the custom DB path:
blast_db: "/path/to/blastdb/ref_db"