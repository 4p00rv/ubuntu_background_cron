#Ubuntu Background Auto Changer

This program helps in automatically changing the background of Ubuntu. It uses a cron which triggers the script. This script selects an image file from the folder it is residing in.    

##Adding cron
`crontab -e`   

If it is your first time then it will ask you to select an editor, you can select any.   

Then add the following lines at the end:   
`* * * * * ruby /path_to/change_wallpaper.rb >> /dev/null 2>&1`   
Now your wallpaper will be updated every minute. You can set various constraints to job by going through this [article](http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/).   

##Output
![](http://i.imgur.com/FjHbDXv.gif?1 =100x100)