# Bing Wallpaper
some small scripts that download the current days bing wallpaper to your computer and sets it to your background

------
### MacOS  use via cron (or launchctl)
------
- Install command line tools: ```brew install wget jq```
- Allow exeuction of the script
 - ```chmod +x ./bing-wallpaper.sh```
- Then create a cron schedule
 - ```echo "0 7 * * * ~/bing-wallpaper.sh" | crontab -```

#### To Run on an automated schedule with auto-run if the schedule is misssed
1. Use ```luanchctl``` the file ```macOS/com.jonsch.bingwallpaper.plist``` is included in this repostiroy, simply use it and update the path to your ```.shf iile``` as flagged in the ```.plist file```.

2. Once you have your configuration right run the following:
```cp macOS/com.jonsch.bingwallpaper.plist ~/Library/LaunchAgents/``` and then run the following command ```launchctl load ~/Library/LaunchAgents/com.jonsch.bingwallpaper.plist```.

3. To verify that your service is installed and running you can do the following ```launchctl list | grep com.jonsch.bingwallpaper``` and verify the service is listed.

4. Why do it this way instead of typical cron? If a scheduled is missed on cron unless you're using anacron and MacPorts the cronjob will not update the wallpaper. Using ```launchctl``` daemon, you're able to set a routine that executes on schedule or at next earliest opportunity. 

Hope this helps!

------
### Windows use via task scheduler
------
- Open Task Scheduler
- Click ```Create Basic Task```
- name the task and provide a description
- Set the trigger to "Daily" and choose the time you want the script to run
- For the action, select "Start a Program" and browse to ```powershell.exe```
- In the "Add Arguments" field, enter: ```-File "C:\path\to\your\powershellscript\bing-wallpaper.ps1"```
- Finish the task completion

