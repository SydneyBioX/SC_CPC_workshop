# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/release_core2

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /home/
# ADD setup.R /home/
# ADD user_test.R /home/
# ADD internal_test.R /home/
# ADD omg.R /home/
 
## Make a tmp folder and git clone
## All git files will then be copied to /home/SingleCellPlus/
# RUN mkdir /home/tmp/
# RUN git clone https://github.com/SydneyBioX/SingleCellPlus /home/tmp/
# RUN mkdir /home/SingleCellPlus/
# RUN cp -r /home/tmp/* /home/SingleCellPlus/
## We will remove these data since we will have another copy from Google Cloud Storage
# RUN ls /home/
# RUN ls /home/SingleCellPlus/



## wget all data files from Google Cloud Storage into /home/SingleCellPlus/
RUN wget https://storage.googleapis.com/scp_data/data.zip -P /home/
RUN cd /home/ && unzip ./data.zip
RUN ls /home/
RUN ls /home/SingleCellPlus/


# Running tests
RUN R -f /home/install.R
# RUN R -e 'knitr::purl("/home/SingleCellPlus/qc.Rmd", output = "/home/SingleCellPlus/qc.R")'
# RUN R -e 'knitr::purl("/home/SingleCellPlus/scMerge.Rmd", output = "/home/SingleCellPlus/scMerge.R")'
# RUN R -e 'knitr::purl("/home/SingleCellPlus/downstream.Rmd", output = "/home/SingleCellPlus/downstream.R")'
# RUN R -f /home/internal_test.R