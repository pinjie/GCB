#!/bin/bash

# 確認是否包含所需設定
if grep -q "session required pam_lastlog.so showfailed" /etc/pam.d/postlogin; then
  echo "設定已成功新增或修改於 /etc/pam.d/postlogin 檔案中"
else
  echo "設定未成功新增或修改於 /etc/pam.d/postlogin 檔案中"
fi