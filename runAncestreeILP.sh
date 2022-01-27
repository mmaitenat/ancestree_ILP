#!/bin/bash

## This script runs the ILP algorithm for noise-free instances of Ancestree:
## https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4542783/
## Use the script as:
##              bash runAncestreeILP.sh F.txt
## A sample F matrix is provided in data/F.txt
## Note that CPLEX needs to be installed 

F_filename=$1
Rscript --vanilla --quiet --slave runCalcAncestryGraphs.R ${F_filename}
python solveILP.py ext_ancestry_graph.txt ${F_filename}