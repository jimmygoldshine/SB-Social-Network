class UserProfile

  attr_reader :name, :friends, :unread_messages

  def initialize(network)
    @name ||= get_name
    @friends = {}
    @all_users = network.all_users
    @unread_messages = []
    @read_messages = []
  end

  def add_friend
    puts "Adding a friend... what's their full name?"
    friends_name = gets.chomp
    if @all_users[friends_name.to_sym]
      friends_profile = @all_users[friends_name.to_sym]
      @friends[friends_name.to_sym] = friends_profile
    else
      raise "No users found with that name. Please try again"
    end
  end

  def check_messages
    if any_unread_messages?
      puts "You have #{@unread_messages.length} new message#{pluralize} \n"
      @unread_messages.each do |message|
        puts "#{message.read} \n\n"
      end
      @read_messages << @unread_messages
      @unread_messages.clear
    elsif any_unread_messages?
    else
      puts "You have 0 new messages"
    end
  end

  private

  def pluralize
    if @unread_messages != 1
      return "s"
    end
  end

  def get_name
    puts "First Name: "
    first_name = gets.chomp
    puts "Last Name: "
    last_name = gets.chomp
    @name = "#{first_name} #{last_name}"
  end

  def any_unread_messages?
    @unread_messages.any?
  end

end
