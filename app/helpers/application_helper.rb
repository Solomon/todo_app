module ApplicationHelper

	# Set the title on a per-page basis
	def title
		base_title = "Solomon's To Do"
		if @title.nil?
			base_title
		else
			base_title + " | " + @title
		end
	end

end
