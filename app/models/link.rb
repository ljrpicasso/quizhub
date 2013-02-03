# == Schema Information
#
# Table name: links
#
#  id          :integer         not null, primary key
#  url         :string(255)
#  description :text
#  points      :integer         default(0)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Link < ActiveRecord::Base
  # attr_accessible :title, :body
end
