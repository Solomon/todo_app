require 'spec_helper'

describe User do

	before(:each) do
		@attr = { :email => "example@todoapp.com",
				  :password => "foobar",
				  :password_confirmation => "foobar"				
				}
	end

	it "should create a new user given valid attributes" do
		User.create!(@attr)
	end

	it "should require an email" do
		no_email_user = User.new(@attr.merge(:email => ""))
	end

	it "should accept valid email addresses" do
		addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  		addresses.each do |address|
  			valid_email_user = User.new(@attr.merge(:email => address))
  			valid_email_user.should be_valid
  		end
  	end

	it "should reject invalid email addresses" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |address|
			invalid_email_user = User.new(@attr.merge(:email => address))
			invalid_email_user.should_not be_valid
		end
	end

  it "should reject a duplicate email address" do
  	User.create!(@attr)
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end

  it "should reject duplicate email addresses regardless of case" do
  	upcased_email = @attr[:email].upcase
  	User.create!(@attr.merge(:email => upcased_email))
  	user_with_duplicate_email = User.new(@attr)
  	user_with_duplicate_email.should_not be_valid
  end
  
end
