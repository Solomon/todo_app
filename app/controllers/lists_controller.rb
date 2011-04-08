class ListsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :authorized_user, :only => [:show, :destroy]


	def create
		@list = current_user.lists.build(params[:list])
		if @list.save
			flash[:success] = "List Created"
			redirect_to root_path
		else
			flash[:notice] = "Could not create list"
			redirect_to root_path
		end
	end

	def index
		@lists = current_user.lists.paginate(:page => params[:page])
		@title = "Lists"
	end


	private

		def authorized_user
			@list = List.find(params[:id])
			redirect_to root_path unless current_user==@list.user
		end


end
