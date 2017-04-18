require 'spec_helper'

describe SocialNetwork do

  let(:user_profile_class) {double(:user_profile_class)}
  let(:network) {described_class.new(user_profile_class)}
  let(:user_profile) { double(:user_profile) }

  before do
    allow(user_profile_class).to receive(:new).and_return(user_profile)
  end

  describe 'Founding Members' do

    it "should have five users created upon initialization" do
      expect(network.all_users.length).to eq(5)
    end

    it "should have a profile associated with their names" do
      expect(network.all_users[:"Elon Musk"]).to be(user_profile)
    end

  end

  describe 'New Members' do

    it "should add new members to all_users" do
      network.sign_up
      expect(network.all_users.length).to eq(6)
    end

  end

end
