#!/bin/bash
#
# Autor: Felipe Gustavo Andrzejewski <felipe.andrzejewski@gmail.com>
# Data: 01/06/2021
#
# Script to remove all bases using a docker environment

#=====================================================#
# Configuration
#=====================================================#
conf="/var/shell-scripts/mysql.cnf"

#=====================================================#
# Connect and bring all bases except the essentials
#   Options: add essential bases
#=====================================================#
DBS="$(mysql --defaults-extra-file=$conf -e 'SHOW DATABASES' | grep -v Database | grep -v information_schema | grep -v performance_schema | grep -v mysql | grep -v sys)";

#=====================================================#
# Drop all bases
#=====================================================#
printf "\n";
for db in $DBS;
do
    mysql --defaults-extra-file=$conf -e "DROP DATABASE IF EXISTS $db";
    printf " == Removed $db \n\n";
done
