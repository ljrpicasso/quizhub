class QuizCat < ActiveRecord::Base
  attr_accessible :category_id, :quiz_id
  belongs_to :quiz
  belongs_to :category
end
