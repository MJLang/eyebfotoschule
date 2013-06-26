require 'spec_helper'

describe SessionsController do

  before :each do 
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
  end

  it "should login with the correct password and admin privileges" do
    params = {:email => @admin.email, :password => 'secret' }
    post :create, params
    response.should redirect_to admin_dashboard_url
  end

  it 'should not let me allow login without admin credentials' do
    params = {:email => @user.email, :password => 'secret' }
    post :create, params
    response.should_not redirect_to admin_dashboard_url
  end


end
