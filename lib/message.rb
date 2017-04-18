class Message

  attr_reader :to, :from, :body, :time, :sender_profile

  def initialize(sender_profile)
    @to
    @body
    @from = sender_profile.name
    @sender_profile = sender_profile
    @time
  end

  def send
    puts "To: "
    @to ||= gets.chomp
    if !(@sender_profile.friends[@to.to_sym])
      puts "No friends found with the name: #{@to}. Please try again"
      send
    end
    @body = body
    @sender_profile.friends[@to.to_sym].unread_messages << self
    puts "\n\n  Your message was sent to #{@to} \n\n"
  end

  def read
    puts "\nFrom: #{@from} at #{Time.now}:"
    puts "Message: #{@body}"
  end

  def body
    puts "Message: "
    message = gets.chomp
    @body = message
  end
end
