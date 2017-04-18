class UserProfile

  attr_reader :name, :friends

  def initialize(social_network)
    @name = get_name
    @friends = {}
    @network = social_network
  end

  def get_name
    puts "First Name: "
    first_name = gets.chomp
    puts puts "Last Name: "
    last_name = gets.chomp
    @name = "#{first_name} #{last_name}"
  end

  def add_friend
    puts "Friend's name: "
    friends_name = gets.chomp
    if @network.all_users[friends_name.to_sym]
      friends_profile = @network.all_users[friends_name.to_sym]
      @friends[friends_name.to_sym] = friends_profile
    else
      raise "No users found with that name. Please try again"
    end
  end

end
