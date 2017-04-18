class SocialNetwork

  def initialize(user_profile_class)
    @user_profile = user_profile_class.new
  end

  def all_users
    {:"Elon Musk" => @user_profile, :"Jeff Bezos" => @user_profile, :"Mark Zuckerberg" => @user_profile, :"Peter Thiel" => @user_profile, :"Reid Hoffman" => @user_profile}
  end

end
