include { generate_standard_filename } from '../external/pipeline-Nextflow-module/modules/common/generate_standardized_filename/main.nf'
/*
    Nextflow module for filtering variant calls

    input:
        sample_id: identifier for sample
        sample_vcf: path to VCF to filter
        sample_vcf_tbi: path to index of VCF to filter

    params:
        params.output_dir_base: string(path)
        params.docker_image_gatk: string
*/
process run_SelectVariants_GATK {
    container params.docker_image_gatk
    publishDir path: "${META.output_dir_base}/output",
      mode: "copy",
      pattern: "*.vcf.gz*"

    input:
    val(META)
    tuple val(sample_id), path(sample_vcf), path(sample_vcf_tbi)

    output:
    tuple val(sample_id),
          path("${output_filename}"),
          path("${output_filename}.tbi"), emit: pass_filtered

    script:
    output_filename_base = generate_standard_filename(META.current_caller, params.dataset_id, sample_id, [:])
    output_filename = "${output_filename_base}_pass.vcf.gz"

    """
    set -euo pipefail

    gatk SelectVariants \
        -V ${sample_vcf} \
        --exclude-filtered \
        -O ${output_filename}
    """
}
