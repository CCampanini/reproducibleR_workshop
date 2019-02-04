<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build
Status](https://travis-ci.com/alaindanet/reproducibleR_workshop.svg?branch=master)](https://travis-ci.com/alaindanet/reproducibleR_workshop)

ReproducibleR
=============

The goal of ReproducibleR is to help you to make your analysis
reproducible.

Prerequisites
-------------

You need to have the following softwares:

-   [Git](https://git-scm.com/downloads) to version your work
-   [Docker](https://docs.docker.com/install/) to ensure that we work in
    the same container

### Install Git

-   [Download page for all platform](https://git-scm.com/downloads)

### Install Docker

-   [For windows](https://docs.docker.com/docker-for-windows/install/)
-   For Linux:
    [Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
    and
    [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
-   [Mac OS](https://docs.docker.com/docker-for-mac/install/)

#### Check your install

``` bash
docker run hello-world
```

#### Download an image and run it

Once you have docker, please run the following command. You will get a
container with R, RStudio and several useful packages (see more on
[Rocker](https://github.com/rocker-org/rocker)).

``` bash
docker run -e PASSWORD=<YOUR_PASS> --rm -p 8787:8787 rocker/verse
```

Once you have downloaded it, you can open an Rstudio session in your web
browser. On Linux system, it will be at <http://localhost:8787/>. On
other systems, `localhost` will be replaced by your ip address. Your
will find it when you launch the Docker Quickstart Terminal. Please see
[this
tutorial](http://ropenscilabs.github.io/r-docker-tutorial/02-Launching-Docker.html)
for more details.

Use Docker
----------

### Pointing a Docker session to your project

``` bash
docker run -e PASSWORD=<YOUR_PASS> --rm -p 8787:8787 -v /path_to_your_project/project_directory:/home/rstudio/project_directory rocker/verse
```

### Commit with git inside a docker container

While running R in a docker container, git will not know you since you
are not in your system environment.

If you run your Docker session which points to a git repository, you can
configure it locally. Your local git config will be available in the
Docker environment.

In your project root, you can run:

``` bash
git config user.name "FirstName LastName"
git config user.email "MY_NAME@example.com"
```

You can check the local set up: `cat .git/config`

\#\# Usage

### Clone the repository

``` bash
git clone https://github.com/alaindanet/reproducibleR_workshop.git dir_name
```

### Compile the presentation

Open the file `talk/talk.Rmd` in Rstudio and knit it or you can run this
command in your R console:

``` r
rmarkdown::render("talk.Rmd")
```

Some useful links
-----------------

### Compendium

-   R compendium: [Example from Carl
    Boettiger](https://github.com/cboettig/template)

-   R package structure: [R packages book](http://r-pkgs.had.co.nz/)

-   A package to create a compendium:
    [rrtools](https://github.com/benmarwick/rrtools)

-   A paper explaining compendia for analysis reproducibility: [Marwick
    et al. (2018)](https://sci-hub.tw/10.1080/00031305.2017.1375986)

-   A real example of research compendium: [by Carl
    Boettiger](https://github.com/cboettig/nonparametric-bayes)

### Docker

-   Using Docker with R: [Ropenscilabs
    course](http://ropenscilabs.github.io/r-docker-tutorial/)

### Git

-   A nice documentation to keep close to you:
    [ProGit](https://git-scm.com/book/en/v2)
