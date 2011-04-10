class ListsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :authorized_user, :only => [:show, :destroy, :edit]


	def create
		@list = current_user.lists.build(params[:list])
		if @list.save
			flash[:success] = "List Created"
			redirect_to lists_path
		else
			flash[:notice] = "Could not create list"
			redirect_to new_list_path
		end
	end

	def index
		@lists = current_user.lists.paginate(:page => params[:page])
		@title = "Lists"
	end

	def new
		@title = "New List"
		@list = List.new		
	end

	def show
		@title = "List"
		@list = List.find(params[:id])
	end

	def edit
		@title = "Edit List"
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:success] = "List updated"
			redirect_to list_path(@list)
		else
			@title = "Edit List"
			render 'edit'
		end
	end

	def destroy
		@list = List.find(params[:id])
		if @list.destroy
			flash[:notice] = "List Deleted"
			redirect_to lists_path
		else
			flash[:error] = "Could not delete"
			redirect_to lists_path
		end
	end


	private

		def authorized_user
			@list = List.find(params[:id])
			redirect_to root_path unless current_user==@list.user
		end


end
