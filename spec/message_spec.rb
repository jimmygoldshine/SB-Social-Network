require 'spec_helper'

describe Message do

  let(:my_profile) {double(:my_profile)}
  let(:elon_profile) {double(:elon_profile)}
  let(:message) {described_class.new(my_profile)}

  before do
    allow(my_profile).to receive(:name).and_return("James Dix")
    allow(elon_profile).to receive(:unread_messages).and_return([])
    allow(my_profile).to receive(:friends).and_return(({ :"Elon Musk" => elon_profile }))
  end

  it "should allow a user to form a message with a To:" do
    allow_any_instance_of(Message).to receive(:gets).and_return("Elon Musk")
    message.send
    expect(message.to).to eq("Elon Musk")
  end

  it "should allow a user to type a message to their friend in the body" do
    allow_any_instance_of(Message).to receive(:gets).and_return("Elon Musk", "Hi Elon - I hope you're well!?")
    message.send
    expect(message.body).to eq("Hi Elon - I hope you're well!?")
  end

  it "should send a friend a message to their friends messages" do
    allow_any_instance_of(Message).to receive(:gets).and_return("Elon Musk", "Hi Elon - I hope you're well!?")
    message.send
    expect(elon_profile.unread_messages).to eq([message])
  end

  it "should allow a friend to read a message" do
    allow_any_instance_of(Message).to receive(:gets).and_return("Elon Musk", "Hi Elon - I hope you're well!?")
    message.send
    expect(elon_profile.unread_messages[0].body).to eq("Hi Elon - I hope you're well!?")
  end

end
