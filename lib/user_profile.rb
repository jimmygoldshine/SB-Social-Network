class UserProfile

  attr_reader :name, :friends, :unread_messages, :read_messages, :all_users, :message_class

  def initialize(network, message_class)
    @name = set_name
    @friends = {}
    @all_users = network.all_users
    @unread_messages = []
    @read_messages = []
    @message_class = message_class
  end

  def add_friend
    puts "\n#{name}, you would like to add a friend... what's their full name?"
    friends_name = gets.chomp
    if user_exists?
      friends_profile = all_users[friends_name.to_sym]
      friends[friends_name.to_sym] = friends_profile
      puts "\nWe successfully found #{friends_name}! You are now friends - go say hi! \n"
    else
      puts "No users found with that name. Are you sure they have a profile?!"
      try_again(add_friend)
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

  def set_name
    puts "\nWelcome to the SB-Social-Network! To sign up we'll need a few details... \n"
    puts "First Name: "
    first_name = gets.chomp
    puts "Last Name: "
    last_name = gets.chomp
    name = "#{first_name} #{last_name}"
    puts "Thank you for signing up, #{first_name}!\n\n"
    name
  end

  def any_unread_messages?
    unread_messages.any?
  end

  def user_exists?
    all_users[friends_name.to_sym]
  end

  def try_again(method)
    self.method
  end

end
