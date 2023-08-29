#!/bin/bash

account_name="your_username"
maxrepeat_value="3" 
current_maxrepeat=$(chage --list "$account_name" | grep "maxrepeat" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

if [ "$current_maxrepeat" -eq "$maxrepeat_value" ]; then
  echo "maxrepeat 參數已成功設定為 $maxrepeat_value"
else
  echo "maxrepeat 參數設定未生效，目前值為 $current_maxrepeat，預期值為 $maxrepeat_value"
fi