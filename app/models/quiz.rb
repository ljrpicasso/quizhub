class Quiz < ActiveRecord::Base
  attr_accessible :name, :points, :description, :source
  has_and_belongs_to_many :categories
end
