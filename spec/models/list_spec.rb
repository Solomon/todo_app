require 'spec_helper'

describe List do

	before(:each) do
		@user = Factory(:user)
		@attr = {:name => "List name"}
	end

	it "should create a new instance given valid attributes" do
		@user.lists.create!(@attr)
	end

	describe "user associations" do

		before(:each) do
			@list = @user.lists.create(@attr)
		end

		it "should have the right associated user" do
			@list.user_id.should == @user.id
			@list.user.should == @user
		end
	end


  
end
