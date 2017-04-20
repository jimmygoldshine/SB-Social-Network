class SocialNetwork

  attr_reader :all_users

  def initialize(user_profile_class, message_class)
    @user_profile_class = user_profile_class
    @message_class = message_class
    @all_users = {}
  end

  def sign_up(first_name, last_name)
    profile = user_profile_class.new(self, message_class, first_name, last_name)
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

  private

  attr_reader :user_profile_class, :message_class
end
