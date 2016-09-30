do
function run(msg, matches)
	if not is_sudo(msg) then return end
	local text = matches[1]
	local b = 1
	while b ~= 0 do
		text = text:trim()
		text,b = text:gsub('^!+','')
	end
	local num = matches[2]
	local enter= '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
	if (text:len() * 2) + 156 <= 4096 then
		for i=1, tonumber(num), 1 do
			send_large_msg('channel#id'..msg.to.id, text..enter..text, ok_cb, false)

		end
	else
		send_large_msg('channel#id'..msg.to.id, 'Over Load Of Maximum Range PM Lenght!', ok_cb, false)
	end
end
return {
 patterns = {
"^[!#/][Ss]pm (.+) (.*)$"
},
run = run,
--privileged = true,
}

--@To0fan
end