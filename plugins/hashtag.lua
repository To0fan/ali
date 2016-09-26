do


local function run(msg, matches)

    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['hsh'] then
                hashtag = data[tostring(msg.to.id)]['settings']['hsh']
            end
			if data[tostring(msg.to.id)]['settings']['pmhsh'] then
                tgs = data[tostring(msg.to.id)]['settings']['pmhsh']
            end
        end
    end

    if hashtag == "yes" then
		--[[if msg.media.type:match("document") then -- msg.text checks
			--local is_hash = msg.text:match("#soal")
			if not msg.text:match("#سوال") and not msg.text:match("#جواب") then
				delete_msg(msg.id, ok_cb, false)
				return
			else
				return
			end
		end]]
		if msg.media then
		--[[if msg.media.title then -- msg.media checks
			--local is_hash_title = msg.media.title:match("#soal")
			if not msg.media.title:match("#سوال") and not msg.media.title:match("#جواب") then
				delete_msg(msg.id, ok_cb, false)	
			end
		end]]
		if msg.media.caption then -- msg.media.caption checks
			--local is_hash_caption = msg.media.caption:match("#soal")
			if not msg.media.caption:match("#سوال") and not msg.media.caption:match("#جواب") and not msg.media.caption:match("#پرسش") and not msg.media.caption:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)
				if tgs == "yes" then
				if msg.media.caption:lower():match("telegram.me/") or msg.media.caption:lower():match("tlgrm.me/") then
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام حاوی لینک تبلیغ ارسال کردید و برطبق قوانین گروه پیام شما حذف کردید. تکرار مجدد این پیام موجب حذف شما از گروه میشود.'
				else
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام بدون هشتگ ارسال کردید و بر طبق قوانین گروه پیام شما حذف گردید.'
				end
				end
				return
			else
				return
			end
		end
		--[[if msg.media.description then -- msg.media.description checks
			--local is_hash_description = msg.media.description:match("#soal")
			if not msg.media.description:match("#سوال") and not msg.media.description:match("#جواب") then
				delete_msg(msg.id, ok_cb, false)	
			end
		end]]
		end
		if msg.fwd_from then
		if msg.fwd_from.title then -- msg.fwd checks
			--local is_hash_fwd = msg.fwd_from.title:match("#soal")
			if not msg.fwd_from.title:match("#سوال") and not msg.fwd_from.title:match("#جواب") and not msg.fwd_from.title:match("#پرسش") and not msg.fwd_from.title:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)
				if tgs == "yes" then
				if msg.fwd_from.title:lower():match("telegram.me/") or msg.fwd_from.title:lower():match("tlgrm.me/") then
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام حاوی لینک تبلیغ ارسال کردید و برطبق قوانین گروه پیام شما حذف کردید. تکرار مجدد این پیام موجب حذف شما از گروه میشود.'
				else
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام بدون هشتگ ارسال کردید و بر طبق قوانین گروه پیام شما حذف گردید.'
				end
				end
			end
		end
		end
		if msg.text then -- msg.text checks
			--local is_hash = msg.text:match("#soal")
			if not msg.text:match("#سوال") and not msg.text:match("#جواب") and not msg.text:match("#پرسش") and not msg.text:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)	
				if tgs == "yes" then
				if msg.text:lower():match("telegram.me/") or msg.text:lower():match("tlgrm.me/") then
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام حاوی لینک تبلیغ ارسال کردید و برطبق قوانین گروه پیام شما حذف کردید. تکرار مجدد این پیام موجب حذف شما از گروه میشود.'
				else
				return 'Name: '..string.gsub(msg.from.print_name, "_", " ")..'\nID: @'..msg.from.username..'\nشما پیام بدون هشتگ ارسال کردید و بر طبق قوانین گروه پیام شما حذف گردید.'
				end
				end
			end
		end
    end
end

 
return {
  patterns = {
  "(.*)"
  },
  run = run
}


end

