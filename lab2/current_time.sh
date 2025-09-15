CURRENT_TIME=$(date +"%H:%M")
END_OF_DAY="17:00"

CURRENT_MINUTES=$(date -d "$CURRENT_TIME" +%s)
END_MINUTES=$(date -d "$END_OF_DAY" +%s)

if [ $CURRENT_MINUTES -ge $END_MINUTES ]; then
    echo "Current time: $CURRENT_TIME. Work day has ended!"
else
    REMAINING=$(( (END_MINUTES - CURRENT_MINUTES) / 60 ))
    HOURS=$(( REMAINING / 60 ))
    MINUTES=$(( REMAINING % 60 ))
    echo "Current time: $CURRENT_TIME. Work day ends in $HOURS hours and $MINUTES minutes."
fi
