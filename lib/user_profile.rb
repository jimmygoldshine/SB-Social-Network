class UserProfile

  attr_reader :name, :friends

  def initialize
    @name = get_name
    @friends = {}

  end

  def get_name
    puts "First Name: "
    first_name = gets.chomp
    puts puts "Last Name: "
    last_name = gets.chomp
    @name = "#{first_name} #{last_name}"
  end

end
