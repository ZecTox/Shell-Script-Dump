#!/bin/bash

##########################
#Author: Tejas

#Date: 6th April 2025

#This Script outputs the node health 

##########################

# Code used for genral practices

set -x # Debug the code (gives us the code that was runned in output)

set -o # Pipefail

set -e # exit the script when there is an error

#
#Actual Script Starts from here
#

df -h # Tells us about the disc space of the system and user thats used 

free -g # Tells us about the memory that we have used in the instance/system

nproc # Tells us about the CPU processors we have in the system

top # tell us about the real time processes and the resources that are getting used

# **imp** ps -ef | grep amazon | awk -F" " '{print $2}' 
## ps -ef -> used to take the snapshot of the systems currently running proceses
## grep -> to find a line in the string with the text to find in that line from the whole file
## awk -> used for manipulating data and generating report language -> use to print data from columns

curl -> retrives the information from the internet
## example-> curl (some logfile link) | grep ERROR
## One more example-> curl -X GET (api link) -> this is to check an api get response from curl command

# wget -> same function like curl but actually downloads the file in local system

# sudo su - -> used to login as root user.

find -> used to find something in the system

#example: find \(file or directory location) -name (enter the file name)










