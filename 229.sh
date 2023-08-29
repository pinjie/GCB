#!/bin/bash

expected_delay_seconds=4

# 確認登入嘗試失敗延遲時間參數設定
delay_seconds=$(grep "^delay" /etc/security/faillock.conf | awk '{print $3}')

if [ "$delay_seconds" -eq "$expected_delay_seconds" ]; then
  echo "登入嘗試失敗延遲時間參數已成功設定為 $expected_delay_seconds 秒"
else
  echo "登入嘗試失敗延遲時間參數設定未成功更新，目前設定為 $delay_seconds 秒，預期值為 $expected_delay_seconds 秒"
fi
