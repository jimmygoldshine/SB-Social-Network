class SocialNetwork

  attr_reader :all_users

  def initialize(user_profile_class)
    @user_profile_class = user_profile_class
    @all_users = {}
  end

  def sign_up
    profile = @user_profile_class.new(self)
    user_name = profile.name
    @all_users[user_name.to_sym] = profile
    profile
  end

end
