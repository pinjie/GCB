#!/bin/bash


expected_inactive_days=30

# 確認帳號停用前天數設定
inactive_days=$(grep "^INACTIVE" /etc/login.defs | awk '{print $2}')


if [ "$inactive_days" -eq "$expected_inactive_days" ]; then
  echo "帳號停用前天數已成功設定為 $expected_inactive_days 天"
else
  echo "帳號停用前天數設定未成功更新，目前設定為 $inactive_days 天，預期值為 $expected_inactive_days 天"
fi