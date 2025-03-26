#!/usr/bin/env nextflow

process barrnap_process {
    input:
    path input

    output:
    path "${input.simpleName}.barrnap.fasta"

    publishDir "${params.output_dir}", mode: 'copy'

    script:
    """
    barrnap $input --outseq ${input.simpleName}.barrnap.fasta
    """
}
