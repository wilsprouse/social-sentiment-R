#FROM rocker/r-base:latest
FROM myname/myimage:latest

COPY /src/r_social_sentiment.R /src/r_social_sentiment.R


CMD Rscript /src/r_social_sentiment.R

#RUN apt-get update -qq && apt-get -y --no-install-recommends install \
#	libxml2-dev \
#	libcairo2-dev \
#	libsqlite3-dev \
#	libmariadbd-dev \
#	libpq-dev \
#	libssh2-1-dev \
#	unixodbc-dev \
#	libcurl4-openssl-dev \
#	libssl-dev


#COPY /src/install_packages.R /src/install_packages.R
#COPY /src/r_social_sentiment.R /src/r_social_sentiment.R

#RUN Rscript /src/install_packages.R




