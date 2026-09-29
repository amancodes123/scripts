#!/bin/bash

#  user defined variables

hero=“rancho”

villain=“virus”

echo “3 idiots ka hero hai $hero”

echo “3 idiots ka villain hai $villain”

# shell / environment variables bhi hote hai (pre-defined)

echo “current logged in user $USER”

# user input

read -p "Rancho ka poora naam kya tha :" fullname

echo “Rancho ka poora naam $fullname tha”
