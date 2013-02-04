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
#

class Quiz < ActiveRecord::Base
  attr_accessible :name, :points, :description, :source
  has_and_belongs_to_many :categories
  after_initialize :init

  def init
    self.points  ||= 0
    self.source  ||= "???"
    self.archived  = true if self.archived.nil?
    self.active    = true if self.active.nil?
  end

end
