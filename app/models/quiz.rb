class Quiz < ActiveRecord::Base
  attr_accessible :name, :points, :description, :source
end
