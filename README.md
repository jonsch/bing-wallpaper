# Bing Wallpaper
some small scripts that download the current days bing wallpaper to your computer and sets it to your background

### MacOS  use via cron
------
- Allow exeuction of the script
 - ```chmod +x ./bing-wallpaper.sh```
- Then create a cron schedule
 - ```echo "0 7 * * * ~/bing-wallpaper.sh" | crontab -```

### Windows use via task scheduler
------
- Open Task Scheduler
- Click ```Create Basic Task```
- name the task and provide a description
- Set the trigger to "Daily" and choose the time you want the script to run
- For the action, select "Start a Program" and browse to ```powershell.exe```
- In the "Add Arguments" field, enter: ```-File "C:\path\to\your\powershellscript\bing-wallpaper.ps1"```
- Finish the task completion

