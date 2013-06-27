require 'spec_helper'

featue 'Login' do

  before :each do 
    @user = FactoryGirl.create(:admin)
  end

  scenario "with valid credentials" do
    visit '/admin'
    
  end
end