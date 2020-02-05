#!/usr/bin/env bash

nmap $1 -n -sP | grep report | awk '{print $5}'

