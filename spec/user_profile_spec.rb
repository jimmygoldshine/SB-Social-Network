require 'spec_helper'

describe UserProfile do

  let(:profile) {described_class.new}

  before do
    allow_any_instance_of(UserProfile).to receive(:gets).and_return("James","Dix")
  end

  it "should have a friends list of 0" do
    expect(profile.friends.length).to eq(0)
  end

  it "should be initialized with a First Name and Last Name" do
    expect(profile.name).to eq("James Dix")
  end

end
