
do
local function pre_process(msg)

 local hash = 'ma:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, false)
       end
    return msg
 end
 
local function run(msg, matches)
 if matches[1] == 'ma' and is_momod(msg) then
      local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local ti = jdat.ENtime
--local saat = string.sub(ti, 1, 2)
--local minu = string.sub(ti, 4, 5) 
       local hash = 'ma:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             return "⛔️گروه تا اطلاع ثانوی تعطیل میباشد.⛔️"
 else
local hour = string.gsub(matches[2], 'h', '')
 local num1 = tonumber(hour) * 3600
local minutes = string.gsub(matches[3], 'm', '')
 local num2 = tonumber(minutes) * 60
--local second = string.gsub(matches[4], 's', '')
 --local num3 = tonumber(second) 
local num4 = tonumber(num1 + num2)
redis:setex(hash, num4, true)
 return "⏰ساعت:  "..ti.."\n\n⛔️گروه به مدت: \n"..matches[2].." ساعت\n"..matches[3].." دقیقه \nتعطیل میباشد.️"
 end
 end
if matches[1] == 'unma' and is_momod(msg) then
               local hash = 'ma:'..msg.to.id
        redis:del(hash)
          return "✅گروه برای ارسال پیام کاربران باز شد."
  end
end
return {
   patterns = {
      '^[/!#](ma)$',
      '^[/!#](unma)$',
   '^[/!#](ma) (.*) (.*)$',
 },
run = run,
  pre_process = pre_process
}
end
