#!/bin/bash
# Script to remove all bases.
#
# Author: Felipe Gustavo Andrzejewski <felipe.andrzejewski@gmail.com>

conf="/var/shell-scripts/mysql.cnf"
DBS="$(mysql --defaults-extra-file=$conf -e 'SHOW DATABASES' | grep -v Database | grep -v information_schema | grep -v performance_schema | grep -v mysql | grep -v sys)";

printf "\n";
for db in $DBS;
do
    mysql --defaults-extra-file=$conf -e "DROP DATABASE IF EXISTS $db";
    printf " == Removed $db \n\n";
done
