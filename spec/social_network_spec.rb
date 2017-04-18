require 'spec_helper'

describe SocialNetwork do

  let(:network) {described_class.new}

  describe 'Founding Members' do

    it "should have five user profiles created upon initialization" do
      expect(network.all_users.length).to eq(5)
    end

  end

end
