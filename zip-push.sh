# give argument of folder without '/' to zip and push to box

# first zip
zip -r $1.zip $1/

sleep 3

# send zip file to box and log the 'ls' of that folder on box
lftp -e "set ssl-allow true; put -O 'BOX FOLDER PATH' $1.zip; ls 'BOX FOLDER PATH'; bye" -u LOGIN,PASSWORD ftp.box.com > box_log.log

sleep 3

# check if sent file in listing, if so, delete local file and zip
cat box_log.log | grep $1.zip &> /dev/null
if [ $? == 0 ]; then
   rm $1.zip
   rm -rf $1/
   rm box_log.log
fi