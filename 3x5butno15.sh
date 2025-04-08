#!/bin/bash

###########################
##
## Script to show the numbers that are divisible by 3 and 5 but not by 15
##
## Author: Tejas Kedare
##
## Date: 6th April 2025
##
###########################

for i in {1..100}; do
if ([ 'expr $i % 3' == 0 ] || [ 'expr $i % 5' == 0 ]) && [ 'expr $i % 15' != 0 ];	
then
	echo $i
fi;
done
