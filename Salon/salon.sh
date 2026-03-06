#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "1) cut"
  echo "2) color"
  echo "3) perm"
  echo "4) style"
  echo "5) trim"

  read SERVICE_ID_SELECTED
  
  if (( SERVICE_ID_SELECTED > 0 && SERVICE_ID_SELECTED < 6 ))
  then
    APPOINTMENT_MENU $SERVICE_ID_SELECTED
    
  else
    MAIN_MENU "I could not find that service. What would you like today?"

  fi
}

APPOINTMENT_MENU(){
  SERVICE_ID_SELECTED=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    insertCustomer=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)

  fi
  customerSearch=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)
  serviceName=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | xargs)
  echo -e "\nWhat time would you like your $serviceName, $customerSearch?"
  read SERVICE_TIME

  insertAppointment=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $serviceName at $SERVICE_TIME, $customerSearch."
}

MAIN_MENU