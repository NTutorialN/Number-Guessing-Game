#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

function GUESS_PROMPT () {
  if [[ $1 ]]
  then
    echo -e "\n\n$1"
  else 
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi

  read GUESS
}

echo -e "\nEnter your username:"

read USERNAME

if [[ -z $USERNAME ]]
then
  echo -e "\nNo username provided."
  exit
fi

USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE name = '$USERNAME';")
if [[ -z $USER_INFO ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
  GAMES_PLAYED=0
  BEST_GAME=9999
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2)
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((1 + $RANDOM % 1001 ))

GUESS_COUNT=1
GUESS_PROMPT

while (( $GUESS != $SECRET_NUMBER )) 
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_PROMPT "That is not an integer, guess again: "
  else
    ((GUESS_COUNT++))
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      GUESS_PROMPT "It's lower than that, guess again:"
    else
      GUESS_PROMPT "It's higher than that, guess again:"
    fi
  fi
done

((GAMES_PLAYED++))
if [[ $GUESS_COUNT -lt $BEST_GAME ]]
then
  BEST_GAME=$GUESS_COUNT
fi

UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE name = '$USERNAME';")


echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job! "
