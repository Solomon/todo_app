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

		describe "success" do

			before(:each) do
				@attr = {:name => "New List", :description => "a new to do list"}
			end

			it "should create a list" do
				lambda do
					post :create, :list => @attr
				end.should change(List, :count).by(1)
			end
		end

	end

	describe "GET 'new'" do

		describe "if not signed in" do

			it "should redirect to sign in page" do
				get :new
				response.should redirect_to(new_user_session_path)
			end

		end

		describe "if signed in" do

			before(:each) do
				@user = sign_in(Factory(:user))
			end

			it "should be successful" do
				get :new
				response.should be_success
			end

			it "should have the right title" do
				get :new
				response.should have_selector("title", :content => "New List")
			end
		end
	end


end
