# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/release_core2

MAINTAINER kevin.wang@sydney.edu.au

## R package installation scripts
ADD install.R /home/ 

## Setup folder structure
ADD docker_setup.sh /home/

## Set up tests for Docker compile, large memory, use config.yaml when building Docker
ADD docker_test.R /home/   

## Users should source this script to set up their folder
ADD user_setup.R /home/   


## Emergency script
ADD omg.R /home/ 

## Install all R packages
RUN R -f /home/install.R

## Set up data and teaching materials
RUN sh /home/docker_setup.sh 

