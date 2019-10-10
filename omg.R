## If things goes wrong, 
## the admin of the workshop will 
#
# sudo rm -rf /home/tmp/*
# cd /home/tmp/
# sudo git clone https://github.com/SydneyBioX/SingleCellPlus 
# sudo cp -r /home/tmp/SingleCellPlus/* ./
# sudo rm -rf SingleCellPlus
## and ask all users to run this script
if (interactive() ){
  nuke <- readline(prompt = "Enter 'Yes' only if you saved your changed file as a different name (e.g. 'qc.Rmd' is now 'qc_myname.Rmd'):  ")
 if(nuke == "Yes"){system(paste0("cp -r /home/tmp/* ", getwd()))}
  rm(nuke)
  
  download.file(url = "https://i.imgur.com/e0u37lt.jpg", 
                destfile = paste0(getwd(), "/angry_cat.jpg"))
  browseURL(paste0(getwd(), "/angry_cat.jpg"))
}

# system("sudo apt-get -y install libjpeg-dev")
# system("sudo apt-get -y install libcairo2-dev")
# devtools::install_github("IndrajeetPatil/kittyR")
# kittyR::kittyR(meow = FALSE)