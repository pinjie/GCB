#!/bin/bash


expected_min_days=1

# 確認最短使用期限設定
min_days=$(grep "^PASS_MIN_DAYS" /etc/login.defs | awk '{print $2}')


if [ "$min_days" -eq "$expected_min_days" ]; then
  echo "系統密碼最短使用期限已成功設定為 $expected_min_days 天"
else
  echo "系統密碼最短使用期限設定未成功更新，目前設定為 $min_days 天，預期值為 $expected_min_days 天"
fi