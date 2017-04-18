class Message

  attr_reader :to, :from, :body, :time

  def initialize(sender_profile)
    @to
    @body
    @from = sender_profile.name
    @sender_profile = sender_profile
    @time
  end

  def send
    puts "Name of recipient: "
    @to ||= gets.chomp
    if !(@sender_profile.friends[@to.to_sym])
      raise "No friends found with that name. Please try again"
    end
    @body = body
  end

  def body
    puts "Message: "
    message = gets.chomp
    @body = message
  end
end
