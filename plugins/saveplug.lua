local function saveplug(extra, success, result)
  local msg = extra.msg
  local name = extra.name
  local receiver = get_receiver(msg)
  if success then
    local file = 'plugins/'..name..'.lua'
    print('File saving to:', result)
    os.rename(result, file)
    print('File moved to:', file)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, '<i>Failed, please try again!</i>', ok_cb, false)
  end
end
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.reply_id then
   local name = matches[2]
      if matches[1] == "+" and matches[2] and is_sudo(msg) then
load_document(msg.reply_id, saveplug, {msg=msg,name=name})
        return '<b>Plugin</b> <i>'..name..'</i> <b>has been saved.</b>'
      end
        if not is_sudo(msg) then
          return "<b>Only for sudo!</b>"
        end
end
end
return {
  patterns = {
 "^(+) (.*)$",
  },
  run = run,
}
