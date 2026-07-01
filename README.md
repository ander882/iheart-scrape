# iheart-scrape
Just a little utility to scrape the playlist of a iheart radio station over time.

Using bash, core utils, and wget.  Easy!  

So easy, lets run through the whole code right here!

## go.sh
This is a little program to scrape each station every 45 minutes.

```
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
```

## run.sh
This is the meat.  Lets break it down.
go.sh gives us 2 paramiters.  
- "$1" The iheart web site for our station and 
- "$2" the file name to use for the playlist

```
#!/bin/bash

#get the main web page info.  Yeah all of the last 12 songs are in there.  
wget -qO- "$1" | \
# extract just the 12 songs
 grep -oP 'href="\K[^" ]+' | grep artist |grep songs | \
 #Pretty them up to be in tsv format.  Artist \t song
 sed -e 's/\/artist\///' \
     -e 's/-[0-9]*\/songs\//\t/' \
     -e 's/-[0-9]*$//' \
     -e 's/-/ /g'> data/"$2".list

# Print the current playlist info
 wc "$2".playlist

# Only add the unique songs into the list.  don't add duplicates.
 awk 'FNR==NR{existing[$0]; next} !($0 in existing)' "$2".playlist data/"$2".list >> "$2".playlist 

# Print the new playlist info
 wc "$2".playlist
```
