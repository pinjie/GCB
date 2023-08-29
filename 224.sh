#!/bin/bash


expected_algorithm="sha512"

#確認密碼雜湊演算法設定
login_defs_algorithm=$(grep "^ENCRYPT_METHOD" /etc/login.defs | awk '{print $2}')


if [ "$login_defs_algorithm" = "$expected_algorithm" ]; then
  echo "密碼雜湊演算法已成功設定為 $expected_algorithm"
else
  echo "密碼雜湊演算法設定未成功更新，目前設定為 $login_defs_algorithm，預期值為 $expected_algorithm"
fi