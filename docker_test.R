# Running tests
root_folder = "/home/CPC/"
knitr::purl(paste0(root_folder, "qc.Rmd"), output = paste0(root_folder, "qc.R"))
knitr::purl(paste0(root_folder, "scMerge.Rmd"), output = paste0(root_folder, "scMerge.R"))
knitr::purl(paste0(root_folder, "downstream.Rmd"), output = paste0(root_folder, "downstream.Rmd"))


message("Begin internal test")
start = Sys.time()
source(paste0(root_folder, "qc.R"))
rm(list=ls())
gc()
source(paste0(root_folder, "scMerge.R"))
rm(list=ls())
gc()
source(paste0(root_folder, "downstream.R"))
rm(list=ls())
gc()
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
