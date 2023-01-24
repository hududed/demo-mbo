FROM rocker/rstudio:4.2.2
 
MAINTAINER Hud Wahab<hudwahab@gmail.com>
 
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get clean all && \
    apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
COPY ./* /home/rstudio/
RUN Rscript -e "install.packages(c('rmarkdown','mlr3','mlr3mbo','mlr3verse','mlr3extralearners','ranger','DiceKriging','nloptr'));"
