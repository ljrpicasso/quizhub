# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  commentary :text
#  approved   :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Comments < ActiveRecord::Base
  attr_accessible :approved, :commentary, :quiz_id, :user_id
end
