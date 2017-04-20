class UserProfile

  attr_reader :name, :friends, :unread_messages, :read_messages, :all_users, :message_class

  def initialize(network, message_class, first_name, last_name)
    @name = "#{first_name} #{last_name}"
    @friends = {}
    @all_users = network.all_users
    @unread_messages = []
    @read_messages = []
    @message_class = message_class
  end

  def add_friend(friend_name)
    if user_exists?(friend_name)
      friend_profile = all_users[friend_name.to_sym]
      friends[friend_name.to_sym] = friend_profile
    else
      raise "No users found with that name. Are you sure they have a profile?!"
      self.add_friend(name)
    end
  end

  def send_message
    message = message_class.new(self)
    message.send
  end


  def check_messages
    if any_unread_messages?
      puts "\n#{name}, you have #{unread_messages.length} new message#{pluralize}: \n"
      unread_messages.each do |message|
        puts "#{message.read} \n\n"
      end
      read_messages << unread_messages
      unread_messages.clear
    else
      puts "\n #{name}, you have 0 new messages"
    end
  end

  private

  def pluralize
    return unread_messages.length != 1 ? "s" : ""
  end

  def set_name(first_name, last_name)
    name = "#{first_name} #{last_name}"
    puts "Thank you for signing up, #{first_name}!\n\n"
    name
  end

  def any_unread_messages?
    unread_messages.any?
  end

  def user_exists?(name)
    all_users[name.to_sym]
  end

  def try_again(method)
    self.method
  end

end
