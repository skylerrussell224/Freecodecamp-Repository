#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#print function
PRINT_ELEMENT() {
  IFS="|" read ATOMIC_NUMBER ELEMENT SYMBOL TYPE MASS MELTING_POINT BOILING_POINT <<< "$($PSQL "
  SELECT p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
  FROM properties AS p
  JOIN types AS t ON p.type_id = t.type_id
  JOIN elements AS e ON p.atomic_number = e.atomic_number
  WHERE p.atomic_number = $NUMBER")"

  echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

if [[ $1 ]]
then

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #search for atomic_number
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    if [[ -n $NUMBER ]]
    then
      #if found
      PRINT_ELEMENT $NUMBER
    else
      #if not found
      echo "I could not find that element in the database."
    fi

  else
    #search for symbol or name
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
    if [[ -n $NUMBER ]]
    then
      #if found
      PRINT_ELEMENT $NUMBER
    else
      #if not found
      echo "I could not find that element in the database."
    fi
  fi
else
  echo "Please provide an element as an argument."
fi


