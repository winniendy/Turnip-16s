process blast_process {

    tag "$input.name"
    input:
    path input

    output:
    path "${input.simpleName}.blast.txt"

    publishDir "${params.output_dir}", mode: 'copy'

    script:
    """
    blastn -query $input -db ${params.blast_db} \\
           -outfmt '6 qseqid sseqid sscinames staxids pident length evalue bitscore qlen' \\
           -max_target_seqs 10 \\
           -out ${input.simpleName}.blast.txt
    """
}
