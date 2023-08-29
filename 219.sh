#!/bin/bash

account_name="your_username"

dictcheck_value="1"  

current_dictcheck=$(chage --list "$account_name" | grep "dictcheck" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

if [ "$current_dictcheck" -eq "$dictcheck_value" ]; then
  echo "dictcheck 參數已成功設定為 $dictcheck_value"
else
  echo "dictcheck 參數設定未生效，目前值為 $current_dictcheck，預期值為 $dictcheck_value"
fi