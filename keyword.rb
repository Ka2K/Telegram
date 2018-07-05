require 'telegram/bot'

token = ENV["telegram_token"]

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/worldcup'
      bot.api.send_message(chat_id: message.chat.id, text: "2018 World Cup")
    end    
  end
end