require 'spec_helper'

describe Message do

  message_to_friend = "Elon Musk"
  message_to_non_friend = "Barry White"
  message_body = "Happy birthday!!!"
  let(:my_profile) {double(:my_profile)}
  let(:elon_profile) {double(:elon_profile)}
  let(:message) {described_class.new(my_profile)}

  before do
    allow(my_profile).to receive(:name).and_return("James Dix")
    allow(elon_profile).to receive(:unread_messages).and_return([])
    allow(my_profile).to receive(:friends).and_return(({ :"Elon Musk" => elon_profile }))
  end

  it "should allow a user to create a new message setting 'to'" do
    message.write(message_to_friend, message_body)
    expect(message.to).to eq("Elon Musk")
  end

  it "should allow a user to create a new message setting 'body'" do
    expect{message.write(message_to_non_friend, message_body)}.to raise_error("No friends found with the name: Barry White. Please try again")
  end

  it "should allow a user to read a message 'from'" do
    message.write(message_to_friend, message_body)
    message.send
    expect(message.from).to eq("James Dix")
  end

  it "should allow a user to read a message 'body'" do
    message.write(message_to_friend, message_body)
    message.send
    expect(message.body).to eq("Happy birthday!!!")
  end



end
