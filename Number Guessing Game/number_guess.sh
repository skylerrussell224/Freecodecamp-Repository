#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read username

#check if username exists already
check=$($PSQL "SELECT username FROM users WHERE username='$username'")

if [[ -n $check ]]
then
#if username has been used before

  IFS="|" read games_played best_game <<< $($PSQL "
  SELECT COUNT(*),
  MIN(g.guesses)
  FROM games AS g
  JOIN users AS u ON g.user_id = u.user_id
  WHERE u.username = '$username'")
  
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
  #if username has NOT been used before
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$username')"
fi


#generate secret number
secret_number=$((RANDOM % 1000 + 1))
guess=0
number_of_guesses=0

echo "Guess the secret number between 1 and 1000:"
while true
do
  read guess
  
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

    ((number_of_guesses++))
  
  if [[ $guess -gt $secret_number  ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $guess -lt $secret_number ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
    user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")
    $PSQL "INSERT INTO games(user_id, guesses) VALUES($user_id, $number_of_guesses)" > /dev/null
    break
  fi
done