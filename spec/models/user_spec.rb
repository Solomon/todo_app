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
  
end
