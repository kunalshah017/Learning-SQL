#! /bin/bash

if [[ $1 == "test" ]]
then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate teams, games")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1;")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OG
do
    if [[  $YEAR != "year" ]]
    then
        
        # get team id of winner team
        WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
        
        #if winner team not found then enter
        if [[ -z $WINNER_TEAM_ID ]]
        then
            #insert team
            INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$WINNER')")
            if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
                echo Inserted into teams, "$WINNER"
            fi
            WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
        fi
        
        # get team id of opponent team
        OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
        
        # if opponent team not found then enter
        if [[ -z $OPPONENT_TEAM_ID ]]
        then
            #insert team
            INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$OPPONENT')")
            if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
                echo Inserted into teams, "$OPPONENT"
            fi
            OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
        fi
        
        # insert into games table
        
        INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ('$YEAR','$ROUND','$WINNER_TEAM_ID','$OPPONENT_TEAM_ID','$WG','$OG')")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
        then
            echo GAME ADDED for Year:"$YEAR"
        fi
    fi
done