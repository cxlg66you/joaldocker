#!/bin/bash

# Commands to run before starting the bot:
# Check your logs on heroku to see if you were sucessfull

echo "NOTICE: startup.sh is runnning"
sed -i "s/bot_token/$BOT_TOKEN/g" config.js &&
sed -i "s/your_tg_userid/$USER_ID/g" config.js 
sed -i "s/tg_whitelist/$USER_NAME/g" config.js
sed -i "s/DEFAULT_TARGET = ''/DEFAULT_TARGET = '$TEAM_DRIVE_ID'/g" config.js
node clear-db.js
cat config.js
wget --no-check-certificate -q https://raw.githubusercontent.com/cddc22/her/master/sa.zip
ls
unzip -qq sa.zip -d ./ 
ls -l sa.zip
