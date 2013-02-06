# == Schema Information
#
# Table name: quizzes
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  points      :integer
#  description :text
#  source      :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  archived    :boolean
#  active      :boolean
#

class Quiz < ActiveRecord::Base
  attr_accessible :name, :points, :description, :source, :category_attributes, :quiz_cat_attributes, :category_ids
  has_many :categories, :through => :quiz_cats
  has_many :quiz_cats
  accepts_nested_attributes_for :categories, :quiz_cats
  after_initialize :init

  def init
    self.points  ||= 0
    self.source  ||= "???"
    self.archived  = true if self.archived.nil?
    self.active    = true if self.active.nil?
  end

  def category_list
    cl = ' '
    qc = QuizCat.find_all_by_quiz_id(id)
    qc.each do |c|
      if cl.length > 1
        cl << ", "
      end
      cl << Category.find(c.category_id).name
    end
    if cl == ' '
      cl = 'none specified'
    end
    cl
  end

end
