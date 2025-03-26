#!/usr/bin/bash
#SBATCH --account=bphl-umbrella
#SBATCH --qos=bphl-umbrella
#SBATCH --job-name=turnip
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=200gb
#SBATCH --time=48:00:00
#SBATCH --output=results/turnip_%j.out
#SBATCH --error=results/turnip_%j.err
#SBATCH --mail-user=yi.huang@flhealth.gov
#SBATCH --mail-type=FAIL,END


module purge
module load nextflow
module load barrnap
module load ncbi_blast

nextflow run main.nf -params-file params.yaml
