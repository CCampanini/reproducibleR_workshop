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
    ([get the executable
    here](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe).
    Otherwise, they will try to make you create an account on Dockerhub)
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
will find it when you launch the Docker Quickstart Terminal.

Rstudio will ask you for a username and a password. The username is
`rstudio` by default and the password is the one that you specified in
the above command.

Please see [this
tutorial](http://ropenscilabs.github.io/r-docker-tutorial/02-Launching-Docker.html)
for more details.

Use Docker
----------

### Pointing a Docker session to your project

The above command created an container isolated from your hard disk and
all that you have created is erased when you close your Docker
container.

Although, we often need files and data that are in a project directory.
This can be be done with the `-v` flag (v for volume). The part on the
left (before `:`) indicates the path on your computer (can be replaced
by `$(pwd)` if it is the current directory), and the right side (after
`:`) indicates the path in the container (should always begin by
`/home/rstudio/`).

``` bash
docker run -e PASSWORD=<YOUR_PASS> --rm -p 8787:8787 -v /path_to_your_project/project_directory:/home/rstudio/project_directory rocker/verse
```

More details can be found
[here](https://ropenscilabs.github.io/r-docker-tutorial/02-Launching-Docker.html).

### Commit with git inside a docker container

While running R in a docker container, git will not know you since you
are not in your system environment.

If you run your Docker session which points to a git repository, you can
configure it locally. Your local git config will be available in the
Docker environment.

In your project root, you can run:

``` bash
# Set up your identity
git config user.name "FirstName LastName"
git config user.email "MY_NAME@example.com"
```

Note that if you are not in the git repository, you have initialize it
before to run the above command. It is done as simply as `git init`.

You can check the local set up: `cat .git/config`

\#\# Usage

### Clone the repository

``` bash
git clone https://github.com/alaindanet/reproducibleR_workshop.git dir_name
```

### Compile the presentation

#### Build the Docker image

You can see that there is a `Dockerfile` in the repository. The
`Dockerfile` contains all the informations necessary to install all
dependencies that is needed to execute your code. In this specific case,
it contains intructions to install packages necessary to compile the Rmd
presentation in a pdf beamer presentation.

The following command will execute all the command in the `Dockerfile`
and store it as an image that we have to name to call it later (Let’s
name it `workshop_image`):

``` bash
docker build -t workshop_image .
```

Now you can run Docker with the image that we have just created:

``` bash
docker run -e PASSWORD=<YOUR_PASS> --rm -p 8787:8787 -v $(pwd):/home/rstudio/project workshop_image:latest
```

#### Compile

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
