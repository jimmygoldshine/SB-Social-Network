class UserProfile

  attr_reader :name, :friends, :unread_messages, :read_messages, :draft_message

  def initialize(args)
    @name = "#{args[:first_name]} #{args[:last_name]}"
    @all_users = args[:network].all_users
    @message_class = args[:message_class]
    @friends = {}
    @unread_messages = []
    @read_messages = []
    @draft_message = nil
  end

  def add_friend(friend_name)
    if user_exists?(friend_name)
      add_friend_to_friend_list(friend_name)
    else
      raise "No users found with that name. Are you sure they have a profile?!"
    end
  end

  def write_message(to, body)
    written_message = create_message_with_details(to, body)
    set_draft_message(written_message)
    draft_message
  end

  def send_message
    if no_draft_message?
      raise "No draft message to send"
    end
    send_message_to_friend
    set_draft_message(nil)
  end

  def check_messages
    if any_unread_messages?
      puts "\n#{name}, you have #{unread_messages.length} new message#{pluralize}: \n"
      unread_messages.each do |message|
        puts "#{message.read} \n\n"
      end
      read_messages << unread_messages
      unread_messages.clear
    else
      puts "\n #{name}, you have 0 new messages"
    end
  end

  private

  attr_reader :message_class, :all_users

  attr_writer :draft_message

  def set_draft_message(written_message)
    self.draft_message = written_message
  end

  def pluralize
    return unread_messages.length != 1 ? "s" : ""
  end

  def set_name(first_name, last_name)
    name = "#{first_name} #{last_name}"
    puts "Thank you for signing up, #{first_name}!\n\n"
    name
  end

  def any_unread_messages?
    unread_messages.any?
  end

  def user_exists?(name)
    all_users[name.to_sym]
  end

  def add_friend_to_friend_list(friend_name)
    friend_profile = all_users[friend_name.to_sym]
    friends[friend_name.to_sym] = friend_profile
  end

  def no_draft_message?
    draft_message == nil
  end

  def create_message_with_details(to, body)
    message = message_class.new(self)
    written_message = message.write(to, body)
    written_message
  end

  def send_message_to_friend
    draft_message.send
  end

end
