class SocialNetwork

  attr_reader :all_users

  def initialize(user_profile_class, message_class)
    @user_profile_class = user_profile_class
    @message_class = message_class
    @all_users = {}
  end

  def sign_up
    profile = @user_profile_class.new(self, @message_class)
    user_name = profile.name
    @all_users[user_name.to_sym] = profile
  end
end
