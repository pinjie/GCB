#!/bin/bash
chang_216(){
	account_name="your_username"
	difok_value="3"  
	current_difok=$(chage --list "$account_name" | grep "difok" | awk -F: '{print $2}' | sed 's/^[ \t]*//')


	if [ "$current_difok" -eq "$difok_value" ]; then
	  echo "difok 參數已成功設定為 $difok_value"
	else
	  echo "difok 參數設定未生效，目前值為 $current_difok，預期值為 $difok_value"
	fi
}
chang_217(){
	account_name="your_username"
	maxclassrepeat_value="5"  
	current_maxclassrepeat=$(chage --list "$account_name" | grep "maxclassrepeat" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

	if [ "$current_maxclassrepeat" -eq "$maxclassrepeat_value" ]; then
	  echo "maxclassrepeat 參數已成功設定為 $maxclassrepeat_value"
	else
	  echo "maxclassrepeat 參數設定未生效，目前值為 $current_maxclassrepeat，預期值為 $maxclassrepeat_value"
	fi
}
chang_218(){
	account_name="your_username"
	maxrepeat_value="3" 
	current_maxrepeat=$(chage --list "$account_name" | grep "maxrepeat" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

	if [ "$current_maxrepeat" -eq "$maxrepeat_value" ]; then
	  echo "maxrepeat 參數已成功設定為 $maxrepeat_value"
	else
	  echo "maxrepeat 參數設定未生效，目前值為 $current_maxrepeat，預期值為 $maxrepeat_value"
	fi
}
chang_219(){
	account_name="your_username"

	dictcheck_value="1"  

	current_dictcheck=$(chage --list "$account_name" | grep "dictcheck" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

	if [ "$current_dictcheck" -eq "$dictcheck_value" ]; then
	  echo "dictcheck 參數已成功設定為 $dictcheck_value"
	else
	  echo "dictcheck 參數設定未生效，目前值為 $current_dictcheck，預期值為 $dictcheck_value"
	fi
}
chang_220(){
	account_name="your_username"

	deny_value="5"  

	current_deny=$(pam_tally2 --user "$account_name" --query | awk '{print $2}')

	if [ "$current_deny" -eq "$deny_value" ]; then
	  echo "deny 參數已成功設定為 $deny_value"
	else
	  echo "deny 參數設定未生效，目前值為 $current_deny，預期值為 $deny_value"
	fi
}
chang_221(){
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
}
chang_222(){
	account_name="your_username"
	remember_value="5"  
	current_remember=$(chage --list "$account_name" | grep "remember" | awk -F: '{print $2}' | sed 's/^[ \t]*//')


	if [ "$current_remember" -eq "$remember_value" ]; then
	  echo "remember 參數已成功設定為 $remember_value"
	else
	  echo "remember 參數設定未生效，目前值為 $current_remember，預期值為 $remember_value"
	fi
}
chang_223(){
	if grep -q "session required pam_lastlog.so showfailed" /etc/pam.d/postlogin; then
	  echo "設定已成功新增或修改於 /etc/pam.d/postlogin 檔案中"
	else
	  echo "設定未成功新增或修改於 /etc/pam.d/postlogin 檔案中"
	fi
}
chang_224(){
	expected_algorithm="sha512"

	#確認密碼雜湊演算法設定
	login_defs_algorithm=$(grep "^ENCRYPT_METHOD" /etc/login.defs | awk '{print $2}')


	if [ "$login_defs_algorithm" = "$expected_algorithm" ]; then
	  echo "密碼雜湊演算法已成功設定為 $expected_algorithm"
	else
	  echo "密碼雜湊演算法設定未成功更新，目前設定為 $login_defs_algorithm，預期值為 $expected_algorithm"
	fi
}
chang_225(){
	expected_min_days=1

	# 確認最短使用期限設定
	min_days=$(grep "^PASS_MIN_DAYS" /etc/login.defs | awk '{print $2}')


	if [ "$min_days" -eq "$expected_min_days" ]; then
	  echo "系統密碼最短使用期限已成功設定為 $expected_min_days 天"
	else
	  echo "系統密碼最短使用期限設定未成功更新，目前設定為 $min_days 天，預期值為 $expected_min_days 天"
	fi
}
chang_226(){
	expected_warn_days=14

	#確認密碼到期前提醒設定
	warn_days=$(grep "^PASS_WARN_AGE" /etc/login.defs | awk '{print $2}')


	if [ "$warn_days" -eq "$expected_warn_days" ]; then
	  echo "密碼到期前提醒設定已成功設定為 $expected_warn_days 天"
	else
	  echo "密碼到期前提醒設定未成功更新，目前設定為 $warn_days 天，預期值為 $expected_warn_days 天"
	fi
}
chang_227(){
	expected_max_days=90

	# 確認密碼最長使用期限設定
	max_days=$(grep "^PASS_MAX_DAYS" /etc/login.defs | awk '{print $2}')


	if [ "$max_days" -eq "$expected_max_days" ]; then
	  echo "密碼最長使用期限已成功設定為 $expected_max_days 天"
	else
	  echo "密碼最長使用期限設定未成功更新，目前設定為 $max_days 天，預期值為 $expected_max_days 天"
	fi
}
chang_228(){
	expected_inactive_days=30

	# 確認帳號停用前天數設定
	inactive_days=$(grep "^INACTIVE" /etc/login.defs | awk '{print $2}')


	if [ "$inactive_days" -eq "$expected_inactive_days" ]; then
	  echo "帳號停用前天數已成功設定為 $expected_inactive_days 天"
	else
	  echo "帳號停用前天數設定未成功更新，目前設定為 $inactive_days 天，預期值為 $expected_inactive_days 天"
	fi
}
chang_229(){
	expected_delay_seconds=4

	# 確認登入嘗試失敗延遲時間參數設定
	delay_seconds=$(grep "^delay" /etc/security/faillock.conf | awk '{print $3}')

	if [ "$delay_seconds" -eq "$expected_delay_seconds" ]; then
	  echo "登入嘗試失敗延遲時間參數已成功設定為 $expected_delay_seconds 秒"
	else
	  echo "登入嘗試失敗延遲時間參數設定未成功更新，目前設定為 $delay_seconds 秒，預期值為 $expected_delay_seconds 秒"
	fi
}

chang_216()
chang_217()
chang_218()
chang_219()
chang_220()
chang_221()
chang_222()
chang_223()
chang_224()
chang_225()
chang_226()
chang_227()
chang_228()
chang_229()