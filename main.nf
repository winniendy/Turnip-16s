#!/usr/bin/env nextflow

/*
========================================================================================
    Turnip: 16S rRNA Identification and BLAST Pipeline
========================================================================================
    Main workflow that combines modular components for 16S rRNA identification and BLAST analysis
    
    Authors:
    
    
    GitHub: https://github.com/winniendy/Turnip-16s.git
----------------------------------------------------------------------------------------


/*
Note:
Before running the script, please set the parameters in the config file params.yaml
*/

nextflow.enable.dsl = 2

include { barrnap_process } from './modules/barrnap.nf'
include { blast_process } from './modules/blast.nf'
include { summary_and_merge } from './modules/summary.nf'

workflow {

    // Load all FASTA input files (can be a glob like "*.fasta")
    fasta_files = Channel.fromPath(params.input_fasta)

    // Run barrnap on each input file
    barrnap_out = barrnap_process(fasta_files)

    // Run BLAST on each barrnap output
    blast_out = blast_process(barrnap_out)

    // Collect all BLAST outputs into one list for the summary process
    blast_out.collect().set { all_blast_files }

    // Summarize all BLAST results into one master_summary.csv
    summary_and_merge(all_blast_files)
}