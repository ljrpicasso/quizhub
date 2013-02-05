# == Schema Information
#
# Table name: releases
#
#  id           :integer         not null, primary key
#  quiz_id      :integer
#  release_date :date
#  due_date     :date
#  active       :boolean
#  released_by  :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Release < ActiveRecord::Base
  attr_accessible :active, :due_date, :quiz_id, :release_date, :released_by
end
