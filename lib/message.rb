class Message

  def initialize
    @to = to
    @time = Time.now
  end

  def to
    puts "Name of recipient: "
    recipient = gets.chomp
    recipient.to_sym
  end

end
