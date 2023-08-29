#!/bin/bash

account_name="your_username"

deny_value="5"  

current_deny=$(pam_tally2 --user "$account_name" --query | awk '{print $2}')

if [ "$current_deny" -eq "$deny_value" ]; then
  echo "deny 參數已成功設定為 $deny_value"
else
  echo "deny 參數設定未生效，目前值為 $current_deny，預期值為 $deny_value"
fi