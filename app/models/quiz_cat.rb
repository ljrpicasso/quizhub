# == Schema Information
#
# Table name: quiz_cats
#
#  id          :integer         not null, primary key
#  quiz_id     :integer
#  category_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class QuizCat < ActiveRecord::Base
  attr_accessible :category_id, :quiz_id
  belongs_to :quiz
  belongs_to :category
end
