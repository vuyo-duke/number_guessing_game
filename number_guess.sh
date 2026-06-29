#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

randoNum=$(( RANDOM % 1000 + 1 ))
echo -e "Enter your username:"
read USERNAME

echo-e "Guess the secret number between 1 and 1000:"
read GUESS

if [[ "$USERNAME" ]]
then 
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

if [[ ! "$GUESS" =~ ^[ 0-9]+$ ]]
then
echo "That is not an integer, guess again:"
fi

if [[ -z $USERNAME ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

if [[ $GUESS === $randoNum ]]
then
echo "You guessed it in $nOfGuesses tries. The secret number was $secretNumber. Nice job!"
fi

if [[ $GUESS > $randoNum ]]
then
echo "It's higher than that, guess again:"
fi

if [[ $GUESS < $randoNum ]]
then
echo "It's lower than that, guess again:"
fi

# games_played (count), best_game (min guesses), number of guesses (count), secret number (randoNum)