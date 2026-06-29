#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

randoNum=$(( RANDOM % 1000 + 1 ))
echo -e "Enter your username:"
read USERNAME
