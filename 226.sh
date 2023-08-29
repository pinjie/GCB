#!/bin/bash

expected_warn_days=14

#確認密碼到期前提醒設定
warn_days=$(grep "^PASS_WARN_AGE" /etc/login.defs | awk '{print $2}')


if [ "$warn_days" -eq "$expected_warn_days" ]; then
  echo "密碼到期前提醒設定已成功設定為 $expected_warn_days 天"
else
  echo "密碼到期前提醒設定未成功更新，目前設定為 $warn_days 天，預期值為 $expected_warn_days 天"
fi