require 'spec_helper'

describe ListsController do
	render_views

	describe "access control" do

		it "should deny access to create" do
			post :create
			response.should redirect_to(new_user_session_path)
		end

		it "should deny access to destroy" do
			post :create
			response.should redirect_to(new_user_session_path)
		end
	end

	describe "POST 'create'" do

		before(:each) do
			@user = sign_in(Factory(:user))
		end

		describe "failure" do

			before(:each) do
				@attr = {:name => "", :description => ""}
			end

			it "should not create a list" do
				lambda do
					post :create, :list => @attr
				end.should_not change(List, :count)
			end
		end
	end


end
