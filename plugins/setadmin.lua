
 local function run(msg, matches)
 if not is_owner(msg) then
    return nil
  end
 
 local typ = moderator
 local text = 'user#id'..matches[1]
 local chat = 'channel#id'..msg.to.id
   
   if msg.to.type == 'channel' then
     print('added admin')
     channel_set_admin(chat, text, ok_cb, false)
     return "Successfull,  I added "..matches[1].." To Admin."
   else
     return nil
 end  
 end
 
 return {
   patterns = {
     "^[/!]setadmin +(.+)$"
  }, 
   run = run 
 }
