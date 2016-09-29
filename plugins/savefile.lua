local function run(msg, matches)
	if not is_sudo(msg) then
    return 'Error! Only Sudo Can Be Used.'
  end
  local text = matches[1]
  local b = 1
  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  local name = matches[2]
  local file = io.open("./"..name, "w")
  file:write(text)
  file:flush()
  file:close()
  return "DONE✅"
 end
 return {
  description = "Save File For Sudo",
  usage = "Save any things to server",
  patterns = {
    "^[/#!]sf (.+) (.*)$"
  },
  run = run
}

--@To0fan