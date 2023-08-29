#!/bin/bash
account_name="your_username"
remember_value="5"  
current_remember=$(chage --list "$account_name" | grep "remember" | awk -F: '{print $2}' | sed 's/^[ \t]*//')


if [ "$current_remember" -eq "$remember_value" ]; then
  echo "remember 參數已成功設定為 $remember_value"
else
  echo "remember 參數設定未生效，目前值為 $current_remember，預期值為 $remember_value"
fi