local function run(msg, matches)
if not is_sudo(msg) then
    return 'ADD PLUGINS ONLY BY SUDO'
  end
  local text = matches[1]
  local b = 1
  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  local name = matches[2]
  local file = io.open("./plugins/"..name..".lua", "w")
  file:write(text)
  file:flush()
  file:close()
  return "DONE?"
  
 end
 return {
  description = "Save Plugins For Sudo",
  usage = "Save any plugins to server",
  patterns = {
    "^[/#!][Ss][Pp][Ll] (.+) (.*)$"
  },
  run = run
}
--@To0fan