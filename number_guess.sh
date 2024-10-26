#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
	echo Enter your username:
	read USERNAME
	
	#check username
	CHECK_USERNAME=$($PSQL "SELECT username FROM players WHERE username='$USERNAME';")
	
	#if username hasnt been used before
	if [[  -z $CHECK_USERNAME  ]]
	then
		echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
		INSERT_USERNAME=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
		
	#if username has been used before
	else
		GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games JOIN players USING(player_id) WHERE username = '$USERNAME';")
		BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games games JOIN players USING(player_id) WHERE username = '$USERNAME';")
		echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
	fi
	GUESS_NUMBER
}

GUESS_NUMBER() {
	#generate number from 1 to 1000
	SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
	#amount of tries
	TRIES=0
	#start
	echo Guess the secret number between 1 and 1000:
	read PLAYER_GUESS
	
	#loop
	until [[ $PLAYER_GUESS == $SECRET_NUMBER ]]
	do
		#if input is not a number
		if [[  ! $PLAYER_GUESS =~ ^[0-9]+$  ]]
		then
			echo That is not an integer, guess again:
			read PLAYER_GUESS
			((TRIES++))
		#else input is a number
		else
			#if guess is higher
			if [[  $PLAYER_GUESS > $SECRET_NUMBER  ]]
			then
				echo "It's higher than that, guess again:"
				read PLAYER_GUESS
				((TRIES++))
			else
			#else guess is lower
				echo "It's lower than that, guess again:"
				read PLAYER_GUESS
				((TRIES++))
			fi
		fi
	done
	
	((TRIES++))
	#insert game data
	PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")
	INSERT_GAME_DATA=$($PSQL "INSERT INTO games(player_id, number_of_guesses, secret_number) VALUES($PLAYER_ID, $TRIES, $SECRET_NUMBER);")
	echo You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
}

MAIN_MENU
