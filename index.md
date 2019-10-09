---
title: "HKU workshop"
author: "Sydney Precision Bioinformatics Group"
date: "03/05/2019"
output: html_document
---

This is the index page. 


# The Single Cell Plus Workshop

This workshop is part of a joint research initiative between Hong Kong University and the University of Sydney. 


In this workshop we will present thre main topics: 

  1. Quality control of sc-RNASeq data,
  1. The `scMerge` package for integrating multiple sc-RNASeq data, 
  1. Some possible downstream analysis after `scMerge`. 


At the end of this workshop you should have some basic understanding of scRNASeq data and how to deal with them. 


# Prerequisites

Ideally, you should be somewhat familiar with `R`. However, if you haven't used `R` before, don't worry! This is not a programming workshop, you can still pick up important practical skills by running the codes we provided. 

  + `R 3.6` from https://cloud.r-project.org/ 
  + `RStudio` from https://www.rstudio.com/products/rstudio/download/
  

# Installation 


```r
install.packages("BiocManager")

BiocManager::install(c("scMerge", "plotly", "scater", "monocle", "Rtsne", "DropletUtils"))
```



