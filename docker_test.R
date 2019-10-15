# Running tests
root_folder = "/home/CPC/"
setwd(root_folder)
# (all_rmd = list.files(path = root_folder, pattern = "*Rmd",
#                       full.names = TRUE))

(all_rmd = paste0(root_folder, c("scMerge.Rmd", "downstream.Rmd")))
rmarkdown::render(all_rmd[1])
rmarkdown::render(all_rmd[2])

# message("Begin internal test")
# start = Sys.time()
# rmarkdown::render_site(encoding = 'UTF-8')
# end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
