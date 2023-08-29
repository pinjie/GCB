#!/bin/bash
account_name="your_username"
difok_value="3"  
current_difok=$(chage --list "$account_name" | grep "difok" | awk -F: '{print $2}' | sed 's/^[ \t]*//')


if [ "$current_difok" -eq "$difok_value" ]; then
  echo "difok 參數已成功設定為 $difok_value"
else
  echo "difok 參數設定未生效，目前值為 $current_difok，預期值為 $difok_value"
fi