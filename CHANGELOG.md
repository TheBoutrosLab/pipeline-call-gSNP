# Changelog

All notable changes to the pipeline-call-gSNP pipeline.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Fix failing exit code from work dir deletion

## [12.1.2] - 2026-07-13

### Added

- Add explicit setting of `TMPDIR` for XY filter

## [12.1.1] - 2026-07-10

### Added

- Add explicit setting of `TMPDIR` for DeepSomatic

## [12.1.0] - 2026-07-08

### Added

- Add Singularity containerization profile

## [12.0.0] - 2026-05-29

### Added

- `DeepVariant` workflow

### Changed

- Remove usage of `addParams`
- Use `methods.setup_process_afterscript()` for process logs

## [11.1.0] - 2026-04-28

### Changed

- Use NamedTemporaryFile in XY filter script

## [11.0.0] - 2026-04-24

### Added

- Add PAR BED paths to `docs/xy_filtration_workflow.md`
- Add XY Filter to NFTest results
- Add XY filtration
- NFTest test case
- Add containerization profiles

### Changed

- Update resource handling to generalized handler
- Use `TheBoutrosLab` submodules
- Update GATK to 4.6.2.0
- Update Picard to 3.4.0
- Update Hail to 0.2.138

## [10.1.0-rc.1]

### Added

- Add workflow for genotyping from GVCFs

### Changed

- Standardize description
- Update GATK to 4.5.0.0

## [10.0.1] - 2024-04-15

### Changed

- Replace workflow diagram with PlantUML version
- Update PlantUML action to v1.0.1

### Fixed

- Resolve intervals before splitting to allow for index discovery

## [10.0.0] - 2024-03-08

### Added

- Add workflow to generate SVG images from PlantUML
- Add workflow to build and push documentation to GitHub Pages
- Add workflow to run Nextflow configuration regression tests
- Add `CODEOWNERS` file

### Changed

- Resource updater to allow update for all processes

### Removed

- Local resource-related function definitions

## [10.0.0-rc.3] - 2023-08-16

### Added

- Validation with `PipeVal`
- Custom resource allocation updates through configuration parameters

## [10.0.0-rc.2] - 2023-07-25

### Added

- Save tumor segmentation QC output from `CalculateContamination`

### Changed

- Set default compression for `GATK IndelRealignment` to 1
- Make pipeline germline variant calling only

### Removed

- BAM processing steps

## [10.0.0-rc.1] - 2023-05-01

### Added

- Option to delete input data files for metapipeline disk usage optimization

### Changed

- Standardize output file names

## [9.2.1] - 2023-01-25

### Fixed

- Remove duplicated records based on only 11 required fields of each record

## [9.2.0] - 2022-11-18

### Added

- `F32.config` for resource allocation
- Option to emit all confident sites in GVCFs

### Changed

- Use external resource allocation module
- Parameterize Docker registry
- Use `ghcr.io/uclahs-cds` as default registry

## [9.1.0] - 2022-07-12

### Added

- IndelRealignment compression parameter
- Param validation

### Changed

- Parse CSV inputs using modularized `csv_parser`
- Delete merged but un-deduplicated BAMs earlier for more efficient disk usage

### Fixed

- Bug with M64 and F2 detection

## [9.0.1] - 2022-06-02

### Fixed

- Bug with improper output directory due to CSV parsing error

## [9.0.0] - 2022-05-12

### Added

- Option for YAML input
- Record deduplication workflow
- Config for F16 node

### Changed

- Reorganize repo with pipeline entrypoint at root of repo and singular directory names

### Fixed

- Bug with records being duplicated through the parallelized processing of BAMs ([#79](https://github.com/uclahs-cds/pipeline-call-gSNP/issues/79))

## [8.0.0] - 2022-03-14

### Added

- BETA: Support for paired inputs with a single normal sample and multiple tumour samples

### Changed

- Switch to SAMtools for indexing BAMs
- Use sample ID and intervals as identifiers for log output directories
- Standardize config structure
- Partially revert BQSR parallelization and group ApplyBQSR by interval
- Parallelize BaseRecalibrator per sample
- Save VQSR output for QC
- Save SNP+INDEL VQSRed VCF to output

## [7.2.1] - 2022-01-25

### Changed

- Parallelize BQSR
- Update .gitignore

### Security

- Update GATK to 4.2.4.1 to address Log4j vulnerabilities (<https://github.com/advisories/GHSA-8489-44mv-ggj8>, <https://github.com/advisories/GHSA-p6xc-xr62-6r2g>)
- Update Picard version to 2.26.10 to address Log4j vulnerabilities (<https://github.com/advisories/GHSA-8489-44mv-ggj8>)

## [7.2.0] - 2021-12-17

### Changed

- Enable threading for MergeSamFiles
- Parallelize reheadering and indexing processes
- Update reheadering to use -c option
- Modularize workflows for different modes (single vs. paired, WGS vs targeted)
- Update GATK to 4.2.4.0 to address Log4j critical vulnerability (<https://github.com/advisories/GHSA-jfh8-c2jp-5v3q>)
- Update Picard to 2.26.8 to address Log4j critical vulnerability (<https://github.com/advisories/GHSA-jfh8-c2jp-5v3q>)

## [7.1.0] - 2021-11-09

### Added

- Parallelize IR and BQSR in WXS/WES mode

### Fixed

- Fix targeted, single sample mode bugs

## [7.0.0] - 2021-10-27

### Added

- Update call-gSNP to DSL2
- Add GPL2 license
- Parallelize MergeVcfs
- Parallelize MergeSamFiles
- Standardize output and log directories
- Add process to remove intermediate files when save_intermediate_files is disabled
- Parallelize GetPileupSummaries, CalculateContamination, and DepthOfCoverage processes
- Split HaplotypeCaller process into process for VCF and GVCF modes
- Parallelize GVCF HC process
- Extract genome intervals from reference dictionary

### Changed

- Adjust static resource allocation to be more efficient
- Auto-detect reference fasta dictionary
- Rename ".bai" output files to ".bam.bai"
- Auto-detect when in targeted mode and when in WGS mode

[10.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.0.0-rc.3...v10.0.0
[10.0.0-rc.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v9.2.1...v10.0.0-rc.1
[10.0.0-rc.2]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.0.0-rc.1...v10.0.0-rc.2
[10.0.0-rc.3]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.0.0-rc.2...v10.0.0-rc.3
[10.0.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.0.0...v10.0.1
[10.1.0-rc.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.0.1...v10.1.0-rc.1
[11.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v10.1.0-rc.1...v11.0.0
[11.1.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v11.0.0...v11.1.0
[12.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v11.1.0...v12.0.0
[12.1.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v12.0.0...v12.1.0
[12.1.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v12.1.0...v12.1.1
[12.1.2]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v12.1.1...v12.1.2
[7.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/releases/tag/v7.0.0
[7.1.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v7.0.0...v7.1.0
[7.2.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v7.1.0...v7.2.0
[7.2.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v7.2.0...v7.2.1
[8.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v7.2.1...v8.0.0
[9.0.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v8.0.0...v9.0.0
[9.0.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v9.0.0...v9.0.1
[9.1.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v9.0.1...v9.1.0
[9.2.0]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v9.1.0...v9.2.0
[9.2.1]: https://github.com/TheBoutrosLab/pipeline-call-gSNP/compare/v9.2.0...v9.2.1
