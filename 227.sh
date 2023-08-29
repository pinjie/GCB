#!/bin/bash


expected_max_days=90

# 確認密碼最長使用期限設定
max_days=$(grep "^PASS_MAX_DAYS" /etc/login.defs | awk '{print $2}')


if [ "$max_days" -eq "$expected_max_days" ]; then
  echo "密碼最長使用期限已成功設定為 $expected_max_days 天"
else
  echo "密碼最長使用期限設定未成功更新，目前設定為 $max_days 天，預期值為 $expected_max_days 天"
fi