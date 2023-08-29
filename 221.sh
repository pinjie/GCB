#!/bin/bash

account_name="your_username"
deny_value="5"  
unlock_time_value="900"  
current_deny=$(pam_tally2 --user "$account_name" --query | awk '{print $2}')
current_unlock_time=$(pam_tally2 --user "$account_name" --query | awk '{print $4}')


if [ "$current_deny" -eq "$deny_value" ] && [ "$current_unlock_time" -eq "$unlock_time_value" ]; then
  echo "deny 參數已成功設定為 $deny_value，unlock_time 參數已成功設定為 $unlock_time_value"
else
  echo "參數設定未生效：deny 目前值為 $current_deny，預期值為 $deny_value；unlock_time 目前值為 $current_unlock_time，預期值為 $unlock_time_value"
fi