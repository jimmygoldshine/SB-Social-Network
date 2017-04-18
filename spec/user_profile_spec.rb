require 'spec_helper'

describe UserProfile do

  let(:profile) {described_class.new}

  describe 'New Profile' do

    it "should have a friends list of 0" do
      expect(profile.friends.length).to eq(0)
    end

  end

end
