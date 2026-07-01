# iheart-scrape
Just a little utility to scrape the playlist of a iheart radio station over time.

Using bash, core utils, and wget.  Easy!  

So easy, lets run through the whole code right here!

## go.sh
This is a little program to scrape each station every 45 minutes.

'''
#!/bin/bash

while true; do 

#Show the daet/time
date

./run.sh https://www.iheart.com/live/q95-901 q95
 sleep 5
# Add more radio station here

echo
sleep 45m; 
done
'''

## run.sh
This is the meat.  Lets break it down.
go.sh gives us 2 paramiters.  
. The iheart web site for our station and 
. the file name to use for the playlist
