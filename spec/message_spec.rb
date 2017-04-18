require 'spec_helper'

describe Message do

  let(:message) {described_class.new}
  let(:my_profile) {double(:my_profile)}
  let(:elon_profile) {double(:elon_profile)}

  before do
    allow(my_profile).to receive(:friends).and_return(({ :"Elon Musk" => elon_profile }))
    allow_any_instance_of(Message).to receive(:gets).and_return("Elon Musk")
  end

  it "should allows a user to form a message with a To:" do
    expect(message.to).to eq(:"Elon Musk")
  end

end
