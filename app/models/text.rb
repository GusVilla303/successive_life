class Text
  def self.send_text?(current_progress, goal)
    if current_progress < goal
      true
    else
      false
    end
  end

  def self.send_text
    if send_text?

     @client = Twilio::REST::Client.new twilio_sid, {{twilio_token}}
     sms = @client.account.sms.messages.create(:body => "All in the game, yo",
      :to => "5714589476",
      :from => "+15005550006")
      puts sms.body
    end
  end
end
