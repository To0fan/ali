

local function run(msg, matches)

	if matches[1]:lower() == "nerkh" or msg.text == "نرخ" then
		send_large_msg('channel#id'..msg.to.id, '✨ ماهانه: 12000 تومان\n➖➖➖➖➖➖➖➖➖\n✨دو ماه: 21000 تومان\n➖➖➖➖➖➖➖➖➖\n✨سه ماه: 30000 تومان\n➖➖➖➖➖➖➖➖➖\n\nSudo: @To0fan',ok_cb, false)
		
	end

end

return {
	patterns = {
		"^[/!#]([Nn]erkh)$",
		"^نرخ$",	
	},
	run = run,
}
--@To0fan
