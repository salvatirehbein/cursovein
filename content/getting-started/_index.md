---
title: "Começando"
date: 2017-10-17T15:26:15Z
lastmod: 2018-12-08T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false
weight: 9

description: Instalação
images:
- post-cover.png
---


## [Instalação](./installation)

A forma mas facil de instalar vein é, abrir R e escrever na termina:

```r
install.packages("vein")
```

O a versão de [GitHub]()

```r
#install.packages("remotes")
remotes::install_github("atmoschem/vein")
```

De forma automática vão ser instalados os pacotes extras que são necessarios. Os pacotes necessarios sao:

- [sf](https://github.com/r-spatial/sf/), para trabalhar com vetores espaciais.
- [sp](https://github.com/edzer/sp/), antigo pacote de vetores espaciais, usado um caso específico de compatiilidade.
- [data.table](https://github.com/Rdatatable/data.table) processador de data.frame **ultra rapido**.
- [eixport](https://github.com/atmoschem/vein/): lee as saidas espaciais do VEIN e outros para gerar dados de entrada de modelos de qualidade do ar, como [WRF-Chem](https://www2.acom.ucar.edu/wrf-chem).

## [Pre-requisitos]

[sf](https://github.com/r-spatial/sf/) é um pacote de R com interace para as librerías [GDAL](http://www.gdal.org/) (vetores), [PROJ](http://proj4.org/) e [GEOS](http://trac.osgeo.org/geos). Esto implica que estas librerías tem que estar presentes no sistema primeiro antes de instalar sf. 
**eixport** importa funcções do [ncdf4](https://CRAN.R-project.org/package=ncdf4), então também é necessario instalar [NetCDF](https://www.unidata.ucar.edu/software/netcdf/).

As recomendações da pagina web de GitHub [sf](https://github.com/r-spatial/sf/) para instalar as librerias em diferentes siwtemas são:

### Windows

Instala [R], ve a versão e instala [Rtools](https://cran.r-project.org/bin/windows/Rtools/), que provee MinGW-w64 32/64-bit para compilar C, Fortran e C++. Isto é importante porque vein tambem tem codigo em Fortran.

### Ubuntu

```bash
sudo apt-get install libudunits2-dev libgdal-dev libgeos-dev libproj-dev libnetcdf-dev
```

### Fedora

```bash
sudo dnf install gdal-devel proj-devel proj-epsg proj-nad geos-devel udunits2-devel netcdf-devel
```

### Arch

```bash
pacman -S gdal proj geos netcdf
pacaur/yaourt/whatever -S udunits
```

### MacOS

```bash
brew install pkg-config
brew install gdal netcdf
```

## [Configuration](./configuration)

You may specify options in config.toml (or config.yaml/config.json) of your site to make use of this theme's features.

## [Screenshot](./screenshot)
