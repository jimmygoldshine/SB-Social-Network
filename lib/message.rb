class Message

  def initialize(sender_profile)
    @to
    @sender = sender_profile.name
    @sender_profile = sender_profile
    @time = Time.now
  end

  def to
    puts "Name of recipient: "
    @to ||= gets.chomp
    if !(@sender_profile.friends[@to.to_sym])
      raise "No friends found with that name. Please try again"
    end
    @to.to_sym
  end

end
