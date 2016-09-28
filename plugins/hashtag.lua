do
local function warn_user(user_id, chat_id, user_print, user_user)
    local channel = 'channel#id'..chat_id
    --local chat = 'chat#id'..chat_id
    local user = 'user#id'..user_id
    local warn_chat = "2"
    local hash = chat_id..':hshlink:'..user_id
    redis:incr(hash)
    local hashonredis = redis:get(hash)
    if hashonredis then
        if tonumber(warn_chat) ~= 0 then
            if tonumber(hashonredis) >= 2 then
				--send_large_msg(channel, string.gsub('shoma baraye bar X  link ersal kardid va kick mishavid', 'X', tostring(hashonredis)) ,ok_cb, false)
				--redis:set(hash, 0)
                local function post_kick()
					send_large_msg(channel, 'Name: '..string.gsub(user_print, "_", " ")..'\nID: @'..user_user..'\n❌شما برای بار دوم پیام حاوی لینک تبلیغ ارسال کردید و برطبق قوانین از این گروه اخراج میشوید❌' ,ok_cb, false)
                    --chat_del_user(chat, user, ok_cb, false)
                    channel_kick(channel, user, ok_cb, false)
                end
                postpone(post_kick, false, 3)
                redis:getset(hash, 0)

            end
        end
    end
	if tonumber(hashonredis) == 1 then
		send_large_msg(channel, 'Name: '..string.gsub(user_print, "_", " ")..'\nID: @'..user_user..'\n⛔️شما پیام حاوی لینک تبلیغ ارسال کردید و برطبق قوانین گروه پیام شما حذف کردید. تکرار مجدد این پیام موجب حذف شما از گروه میشود.' ,ok_cb, false)
	end
end

local function warn_hash(user_id, chat_id, user_print, user_user)
	local channel = 'channel#id'..chat_id
    --local chat = 'chat#id'..chat_id
    --local user = 'user#id'..user_id
    local warn_chat = "2"
    local hash = chat_id..':hshmsg:'..user_id
	redis:incr(hash)
    local hashonredis = redis:get(hash)
    if hashonredis then
        if tonumber(warn_chat) ~= 0 then
            if tonumber(hashonredis) > 1 then
				redis:getset(hash,1)
			else
				send_large_msg(channel, 'Name: '..string.gsub(user_print, "_", " ")..'\nID: @'..user_user..'\n⛔️شما پیام بدون هشتگ ارسال کردید و بر طبق قوانین گروه پیام شما حذف گردید.' ,ok_cb, false)
            end
        end
	
    end

end

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

		if msg.media then

		if msg.media.caption then -- msg.media.caption
			if not msg.media.caption:match("#سوال") and not msg.media.caption:match("#جواب") and not msg.media.caption:match("#پرسش") and not msg.media.caption:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)
				if tgs == "yes" then
					if msg.media.caption:lower():match("telegram.me/") or msg.media.caption:lower():match("tlgrm.me/") then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					else
						warn_hash(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					end
				end
				return
			else
				return
			end
			if msg.media.caption:match("#سوال") and msg.media.caption:match("#جواب") and msg.media.caption:match("#پرسش") and msg.media.caption:match("#پاسخ") then
				if msg.media.caption:lower():match("telegram.me/") or msg.media.caption:lower():match("tlgrm.me/") then
					if tgs == "yes" then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					end
				end
			end
		end

		end
		if msg.fwd_from then
		if msg.fwd_from.title then -- msg.fwd
			if not msg.fwd_from.title:match("#سوال") and not msg.fwd_from.title:match("#جواب") and not msg.fwd_from.title:match("#پرسش") and not msg.fwd_from.title:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)
				if tgs == "yes" then
					if msg.fwd_from.title:lower():match("telegram.me/") or msg.fwd_from.title:lower():match("tlgrm.me/") then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					else
						warn_hash(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					end
				end
			end
			if msg.fwd_from.title:match("#سوال") and msg.fwd_from.title:match("#جواب") and msg.fwd_from.title:match("#پرسش") and msg.fwd_from.title:match("#پاسخ") then
				if msg.fwd_from.title:lower():match("telegram.me/") or msg.fwd_from.title:lower():match("tlgrm.me/") then
					if tgs == "yes" then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					end
				end
			end
		end
		end
		if msg.text then -- msg.text
			if not msg.text:match("#سوال") and not msg.text:match("#جواب") and not msg.text:match("#پرسش") and not msg.text:match("#پاسخ") then
				delete_msg(msg.id, ok_cb, false)	
				if tgs == "yes" then
					if msg.text:lower():match("telegram.me/") or msg.text:lower():match("tlgrm.me/") then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
				else
						warn_hash(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
					end
				end
			end
			if msg.text:match("#سوال") and msg.text:match("#جواب") and msg.text:match("#پرسش") and msg.text:match("#پاسخ") then
				if msg.text:lower():match("telegram.me/") or msg.text:lower():match("tlgrm.me/") then
					if tgs == "yes" then
						warn_user(msg.from.id, msg.to.id, msg.from.print_name, msg.from.username)
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

