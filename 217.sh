#!/bin/bash
account_name="your_username"
maxclassrepeat_value="5"  
current_maxclassrepeat=$(chage --list "$account_name" | grep "maxclassrepeat" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

if [ "$current_maxclassrepeat" -eq "$maxclassrepeat_value" ]; then
  echo "maxclassrepeat 參數已成功設定為 $maxclassrepeat_value"
else
  echo "maxclassrepeat 參數設定未生效，目前值為 $current_maxclassrepeat，預期值為 $maxclassrepeat_value"
fi