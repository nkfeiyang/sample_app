require 'spec_helper'

describe "Layout links" do
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_tab("a[href=?]", signin_path, "Sign in")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have a signout link" do
      visit root_path
      response.should have_tab("a[href=?]", signout_path, "Sign out")
    end
    
    it "should have a profile link" do
      visit root_path
      response.should have_tag("a[href=?]", user_path(@user), "Profile")
    end
  end


end








































