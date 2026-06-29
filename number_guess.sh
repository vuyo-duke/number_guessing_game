#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

randoNum=$(( RANDOM % 1000 + 1 ))
echo -e "Enter your username:"
read USERNAME

if [[ -z username ]]
then 
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
