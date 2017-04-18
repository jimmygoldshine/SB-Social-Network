class SocialNetwork

  def initialize(user_profile_class)
    @user_profile_class = user_profile_class
    @all_users = {:"Elon Musk" => @user_profile_class.new, :"Jeff Bezos" => @user_profile_class.new, :"Mark Zuckerberg" => @user_profile_class.new, :"Peter Thiel" => @user_profile_class.new, :"Reid Hoffman" => @user_profile_class.new}
  end

  def all_users
    @all_users
  end

  def sign_up
    profile = @user_profile_class.new
    @all_users[:test] = @user_profile_class.new
  end

end
