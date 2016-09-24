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

local apikey = 'ENTER YOUR API KEY HERE'
local cx = 'ENTER YOUR CX HERE'

local function run(msg,matches)
	local url , res = https.request("https://www.googleapis.com/customsearch/v1?&searchType=image&imgSize=xlarge&alt=json&num=10&start=1&key="..apikey.."&cx="..cx.."&q="..URL.escape(matches[2]))
	if res ~= 200 then return 'No connection' end
	local jdat = json:decode(url)
	local text = ''
	if not jdat.items then return "No result found" end
	local i = math.random(#jdat.items)
	local randoms = math.random(1000,900000)
	local randomd = randoms..".jpg"
	local file = download_to_file(jdat.items[i].link,randomd)
	send_photo(get_receiver(msg), file,jdat.items[i].title..'\n\n'..jdat.items[i].link, ok_cb, false)
	-- send_photo(get_receiver(msg), file, ok_cb, false) -- agar TG shoma barae ersale caption edit nashode ast!
	return 
end
return {
   patterns = {"^[/!]([Ii]mg) (.*)$","^[/!]([Ii]mage) (.*)$"},
   run = run
}
