#!  /usr/bin/bash

echo Batteryguard has your back

BAT_THRESHOLD=15
SLEEP_TIME=2

# check status of internal and external battery
# if both batteries have capacity lower than BAT_THRESHOLD: suspend
if [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -le "$BAT_THRESHOLD" ]]
then
    if [[ "$(cat /sys/class/power_supply/BAT1/capacity)" -le "$BAT_THRESHOLD" ]]
    then
        notify-send.sh "battery is low" "Suspending now"
        echo "battery is low, suspending now"
        brightness_bell.sh
        sleep $SLEEP_TIME
        systemctl suspend
        sleep $SLEEP_TIME
        notify-send.sh "BATTERY IS LOW!"
        sleep $SLEEP_TIME
        notify-send.sh "DO SOMETHING!!!!!"
        sleep 1
        brightness_bell.sh
        sleep $SLEEP_TIME
        sleep $SLEEP_TIME
        exit 1
    fi
fi

# all good
brightness_bell.sh
notify-send.sh "Battery charge is ok." "I got your back"
