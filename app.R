options(repos = BiocManager::repositories())

library("recount3")

options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

# CD4+ in mouse RNAseq data set chosen: ERP104512

# Get the info of the project
proj_info <- structure(list(
  project = "ERP104512", organism = "mouse", file_source = "sra",
  project_home = "data_sources/sra", project_type = "data_sources",
  n_samples = 1908L
), row.names = 63856L, class = "data.frame")

rse_gene_ERP104512<- create_rse(proj_info)
assay(rse_gene_ERP104512, "counts") <- compute_read_counts(rse_gene_ERP104512)

rse_gene_ERP104512 <- expand_sra_attributes(rse_gene_ERP104512)

iSEE::iSEE(rse_gene_ERP104512)
