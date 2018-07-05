require 'rest-client'
require 'json'

token = ENV["telegram_token"]
url = "https://api.telegram.org/bot#{token}/getUpdates"
res = RestClient.get(url)
res_json = JSON.parse(res) # JSON ruby에서 쓸 수 있도록 parse
user_id = res_json["result"][0]['message']['from']['id']

msg = "안뇽"
msg_url = URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{user_id}&text=#{msg}")
RestClient.get(msg_url)

def pltable
    url = "https://search.naver.com/search.naver?query=프리미어리그+순위"
    uri = URI.encode(url)
    res = RestClient.get(uri)
    doc = Nokogiri::HTML(res)
    pl_url = doc.css('#teamRankTabPanel_0 .tmp_wrap .scroll .tb_type2 tbody tr td p span a')
    pl_team = []
    pl_url.each do |team|
        pl_team << team.text
    end
    puts pl_team.sample 
end
 