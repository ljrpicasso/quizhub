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
  attr_accessible :active, :due_date, :quiz_id, :release_date, :released_by, :new_default
  belongs_to :quiz
  after_initialize :set_defaults

private
  def set_defaults
    if self.new_record?
      self.release_date = Date.today
      self.due_date = Date.today+7
      self.active = true
      #self.released_by = current_user.id
    end
  end

end
