# == Schema Information
# Schema version: 20110408205527
#
# Table name: lists
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class List < ActiveRecord::Base

	belongs_to :user

	has_many :tasks, :dependent => :destroy

	validates :name, :presence => true
	validates :user_id, :presence => true
end
