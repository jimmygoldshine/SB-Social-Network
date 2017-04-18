class SocialNetwork

  def initialize(user_profile_class)
    @user_profile_class = user_profile_class
    @all_users = {:"Elon Musk" => @user_profile_class.new(self), :"Jeff Bezos" => @user_profile_class.new(self), :"Mark Zuckerberg" => @user_profile_class.new(self), :"Peter Thiel" => @user_profile_class.new(self), :"Reid Hoffman" => @user_profile_class.new(self)}
  end

  def all_users
    @all_users
  end

  def sign_up
    profile = @user_profile_class.new(self)
    user_name = profile.name
    @all_users[user_name.to_sym] = profile
  end

end
