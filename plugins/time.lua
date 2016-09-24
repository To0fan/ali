do
function run(msg, matches) 
 
      
      local url , res = http.request('http://api.gpmod.ir/time/')

      local jdat = json:decode(url)
      local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..jdat.ENtime
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 
end

return { 
  description = "time", 
  usage = { 
    "time نشان دادن ساعت", 
  }, 
  patterns = { 
   "^time$", 
   "^ساعت$",   
  }, 
  run = run 
} 

