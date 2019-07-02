#!/bin/bash
echo "Installing QGIS..."
pacman -S qgis gsl gpsbabel fcgi python-gdal python-jinja python-numpy python-owslib python-psycopg2 python-pygments python-yaml
echo "Done!"
