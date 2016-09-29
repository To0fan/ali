do
local function run(msg, matches)
	if not is_momod(msg) then
		return
	end
	txt = msg.text
	if (matches[1]:lower() == "tell" or matches[1] == "بگو") and matches[2] then
		if matches[1]:lower() == "tell" then
			txt = string.gsub(txt, "[/!#][Tt][Ee][Ll][Ll]", "")
			return txt
		elseif matches[1] == "بگو" then
			txt = string.gsub(txt, "بگو", "")
			return txt
		end
	end


end


return {
	patterns = {
		"^(بگو) (.*)$",
		"^[/!#]([Tt][Ee][Ll][Ll]) (.*)$"
	},
	run = run
}
end