class TodosController < ApplicationController

	before_filter :get_list
	attr_accessor :completed
	respond_to :html, :xml, :js

	def create		
		@todo = @list.todos.new(params[:todo])
		if @todo.save
			flash[:success] = "Todo Created"
			redirect_to list_url(@list)
		else
			flash[:error] = "Couldn't add this todo"
			redirect_to list_url(@list)
		end
	end

	def complete		
		@todo = @list.todos.find(params[:id])
		@todo.completed = true
		@todo.save
		redirect_to list_url(@list)
	end

	private

		def get_list
			@list = List.find(params[:list_id])
		end

end
