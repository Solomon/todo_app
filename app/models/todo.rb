# == Schema Information
# Schema version: 20110411164141
#
# Table name: todos
#
#  id          :integer         not null, primary key
#  description :string(255)
#  completed   :boolean
#  list_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Todo < ActiveRecord::Base

	belongs_to :list

	scope :completed, where(:completed => true)
	scope :incomplete, where(:completed => false)

end
