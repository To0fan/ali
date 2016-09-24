--[[

	@GPMod Team
        @Dragon_Born



آموزش دریافت GOOGLE APIKEY:
با فیلتر شکن به سایت زیر برید و APIKEY خودتون رو بسازید:
http://console.developers.google.com

در صورتی که نتونستید APIKEY رو بسازین پیوی من پیام بدید
telegram.me/dragon_born


آموزش دریافت GOOGLE CX:
https://cse.google.com/cse/create/new

به سایت بالا برید و در ابتدا در قسمت Sites to search نام سایتی به دلخواه را وارد کنید و در قسمت Name of the search engine نامی برای موتور جستوجوگر خودتون بنویسید سپس روی create کلیک کنید
پس از اینکه این پیام رو دیدید (You've successfully created your Custom search engine.) 
۴ خط پایین تر روی Control panel کلیک کنید

در این قسمت Image search رو فعال کنید و روبه روی قسمت Sites to search روی گزینه seach only included sites بزنید و گزینه دوم را فعال کنید(seach the entire web...)
حالا سایتی که در قسمت اول وارد کردید Delete کنید
سپس در قسمت Details روی GET CODE کلیک کنید تا CX KEY شما را دریافت کنید و اون رو در پایین بنویسید 


آموزش نوسط Allen - @Dragon_Born
]]
local apikey = 'ENTER YOUR APIKEY HERE'
local cx = 'ENTER YOUR CX HERE'

local function run(msg,matches)
	local url = https.request("https://www.googleapis.com/customsearch/v1?&alt=json&num=10&start=1&key="..apikey.."&cx="..cx.."&q="..URL.escape(matches[2]))
	local jdat = json:decode(url)
	local text = ''
	if not jdat.items then return 'No result found' end
	for i = 1 , #jdat.items do
		text = text..i..'- '..jdat.items[i].title..'\n'..jdat.items[i].link..'\n\n'
	end
	return text 
end
return {
   patterns = {"^[/!](google) (.*)$","^[/!](g) (.*)$"},
   run = run
}
