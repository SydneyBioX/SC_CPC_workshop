FROM bioconductor/devel_core2

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

## Script for creating user accounts and setting passwords
ADD ./deployment/adduser.R /home/ 
ADD ./deployment/secret.csv /home/

## Set up data and teaching materials
RUN sh /home/docker_setup.sh 

## Install all R packages
RUN R -f /home/install.R

## Running test
RUN R -f /home/docker_test.R

## Adding users
RUN R -f /home/adduser.R
RUN rm /home/secret.csv