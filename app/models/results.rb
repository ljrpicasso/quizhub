# == Schema Information
#
# Table name: results
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  quiz_id    :integer
#  answer_url :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Results < ActiveRecord::Base
  attr_accessible :answer_url, :quiz_id, :user_id
end
