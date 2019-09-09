#!/bin/env Rscript

library(ape)
args<-commandArgs(trailingOnly = T)
tr<-read.tree(args[1])
out_tr<-paste("rooted_",args[1],sep = "")
outgr <-
    tr$tip.label[tr$tip.label %in% c("Csub")]
tryCatch({
    write.tree(root(tr, outgr, resolve.root = T),file = out_tr)
}
, error = function(e) {
    cat(c("ERROR in ",args[1]), conditionMessage(e), "\n\n")
})
