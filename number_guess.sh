#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

secretNumber=$(( RANDOM % 1000 + 1 ))
echo -e "Enter your username:"
read USERNAME



USERNAME_EXISTS=$($PSQL "SELECT username FROM user_table WHERE username='$USERNAME'")
if [[ -z "$USERNAME_EXISTS" ]]
then 
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USER=$($PSQL "INSERT INTO user_table(username) VALUES('$USERNAME')")
else
GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_table WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM user_table WHERE username='$USERNAME'")
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
nOfGuesses=0
echo -e "Guess the secret number between 1 and 1000:"
while true
do
read GUESS

if [[ ! "$GUESS" =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
continue
fi

nOfGuesses=$(( nOfGuesses + 1 ))

if [[ $GUESS -eq $secretNumber ]]
then
echo "You guessed it in $nOfGuesses tries. The secret number was $secretNumber. Nice job!"
UPDATE_GAMES=$($PSQL "UPDATE user_table SET games_played = games_played + 1 WHERE username='$USERNAME'")
if [[ -z $BEST_GAME ]] || [[ $nOfGuesses -lt $BEST_GAME ]]
then
UPDATE_BEST=$($PSQL "UPDATE user_table SET best_game = $nOfGuesses WHERE username='$USERNAME'")
fi
break

elif [[ $GUESS -gt $secretNumber ]]
then
echo "It's higher than that, guess again:"

elif [[ $GUESS -lt $secretNumber ]]
then
echo "It's lower than that, guess again:"
fi
done
# games_played (count), best_game (min guesses), number of guesses (count), secret number (randoNum)