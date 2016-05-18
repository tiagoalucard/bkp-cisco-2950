#!/bin/bash
for IP in `cat lista.txt`;do
# USERNAME
USER=
# PASSWORD
PASS=
# IP do FTP Server
FTP=
# Formato da Data
DATE=`date +%d-%m-%y`
# Start the expect script
(expect -c "
  set timeout 20
  # Start the session with the input variable and the rest of the hostname
  spawn telnet $IP
  expect "Username:"
  send \"$USER\n\"
  expect "Password:"
  send \"$PASS\n\"
  send \"copy running-config ftp://$FTP/$IP-$DATE \n\n\"
  expect "Address*"
  send \"\r\"
  expect "*bytes*"
  send \"exit\r\"
")
done;
