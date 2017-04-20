require 'spec_helper'

describe SocialNetwork do

  let(:network) {described_class.new(user_profile_class, message_class)}
  let(:user_profile_class) {double(:user_profile_class)}
  let(:message_class) {double(:message_class)}
  let(:user_profile) { double(:user_profile) }
  first_name = "James"
  last_name = "Dix"

  before do
    allow(user_profile_class).to receive(:new).with(network, message_class, first_name, last_name).and_return(user_profile)
    allow(user_profile).to receive(:name).and_return("James Dix")
  end

  it "should add new members to all_users" do
    network.sign_up(first_name, last_name)
    expect(network.all_users.length).to eq(1)
  end

  it "should have a profile associated with a name" do
    network.sign_up("James", "Dix" )
    expect(network.all_users[:"James Dix"]).to be(user_profile)
  end

end
