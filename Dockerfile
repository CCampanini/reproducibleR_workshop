# Contains Rstudio and the tydiverse
FROM rocker/verse:latest

# Necessary to compile the presentation
RUN R -e "install.packages('binb', repos = 'https://cloud.r-project.org/')"
RUN tlmgr update --self
RUN tlmgr install beamer translator pgfopts beamertheme-metropolis
