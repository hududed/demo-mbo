FROM rocker/rstudio:4.2.2
 
MAINTAINER Hud Wahab<hudwahab@gmail.com>
 
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get clean all && \
    apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
COPY *.Rmd /home/rstudio/
COPY *.csv /home/rstudio/
COPY *.svg /home/rstudio/
COPY *.png /home/rstudio/
COPY README.md /home/rstudio/
COPY .Rprofile /home/rstudio/

RUN Rscript -e "install.packages(c('DALEX','DALEXtra','e1071','remotes','rmarkdown','mlr3','mlr3mbo','mlr3verse','mlr3learners','mlr3extralearners','ranger','DiceKriging','nloptr','dplyr'));"
