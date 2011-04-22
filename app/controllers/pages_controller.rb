class PagesController < ApplicationController
  def home
  	@title = "Home"
  	if user_signed_in?
  		@feed_items = current_user.todos.incomplete.paginate(:page => params[:page])
  	end
  end

  def about
  	@title = "About"
  end

end
