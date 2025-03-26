process summary_and_merge {

    tag "summary_all"

    input:
    path blast_files  // this is now a list of paths from collect()

    output:
    path "master_summary.csv"

    publishDir "${params.output_dir}", mode: 'copy'

    script:
    """

    echo "sample,qseqid,sseqid,species_name,tax_id,pident,length,evalue,bitscore,coverage" > master_summary.csv

    for f in ${blast_files.join(' ')}; do
        sample=\$(basename \$f .blast.txt)

        if [[ -s \$f ]]; then
            awk -F '\\t' -v sample="\$sample" -v pid_thresh=${params.pident_threshold} '
            {
                cov = (\$6 / \$9) * 100;
                if (\$5 >= pid_thresh)
                    printf "%s,%s,%s,%s,%s,%.2f,%s,%s,%s,%.2f\\n", sample, \$1, \$2, \$3, \$4, \$5, \$6, \$7, \$8, cov;
            }' \$f >> master_summary.csv
        else
            echo "No BLAST results for sample \$sample" >&2
        fi
    done
    """
}