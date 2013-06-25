require 'spec_helper'

describe User do
  before :each do
  	@user = FactoryGirl.create(:user)
  end
  
  it "has a secure password" do
  	@user.password_digest.should == 'secret'
  end

  it "has an auth token" do
  	@user.auth_token.should_not be_nil
  end

  it "is not an admin by default" do
    @user.has_role?(:admin).should == false
  end
end
