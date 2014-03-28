require 'spec_helper'

describe User do
  let(:admin) { FactoryGirl.create(:admin) }

  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it "should auto create a token" do
    expect(:token).to_not be_blank
  end
end
