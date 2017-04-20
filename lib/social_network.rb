class SocialNetwork

  attr_reader :all_users, :user_profile_class, :message_class

  def initialize(user_profile_class, message_class)
    @user_profile_class = user_profile_class
    @message_class = message_class
    @all_users = {}
  end

  def sign_up
    profile = user_profile_class.new(self, message_class)
    user_name = profile.name
    all_users[user_name.to_sym] = profile
  end

  def show_all_users
    user_count = 0
    puts "There are #{all_users.length} users on the SB-Social-Network: \n"
    all_users.each_key do |name|
      user_count += 1
      puts "#{user_count}. #{name}"
    end
  end
end
