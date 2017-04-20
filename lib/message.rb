class Message

  attr_reader :to, :from, :body, :time, :sender_profile

  def initialize(sender_profile)
    @to
    @body
    @from = sender_profile.name
    @sender_profile = sender_profile
    @time
  end

  def write(to, body)
    set_to(to)
    if user_not_in_friend_list
      raise "No friends found with the name: #{to}. Please try again"
    end
    set_body(body)
  end

  def send
    set_time
    send_message_to_friends_unread_messages
  end

  def read
    puts "\nFrom: #{from} at #{time}:"
    puts "Message: #{@body}"
  end

  private

  attr_writer :to, :body, :time

  def set_to(friend)
    self.to = friend
  end

  def set_body(body_of_message)
    self.body = (body_of_message)
  end

  def set_time
    self.time = Time.now
  end

  def user_not_in_friend_list
    !(sender_profile.friends[to.to_sym])
  end

  def send_message_to_friends_unread_messages
    sender_profile.friends[to.to_sym].unread_messages << self
  end

end
