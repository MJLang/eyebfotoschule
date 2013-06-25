require 'spec_helper'

describe User do
  before :each do
  	@user = FactoryGirl.create(:user)
  end

  it "has a secure password" do
  	@user.password_digest.should == 'secret'
  end
end
