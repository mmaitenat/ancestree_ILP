#!/usr/bin/env Rscript
source("calcAncestryGraphs.R")

args <- commandArgs(trailingOnly = TRUE)
F_filename <- args[1]

F_mat <- as.matrix(read.table(F_filename))
A <- calc_ancestry_graph(F_mat)
A_ext <- extend_ancestry_graph(F_mat, A)

write.table(A_ext, file = "ext_ancestry_graph.txt", row.names = FALSE, col.names = FALSE)