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

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Quiz.new.valid?
  end
end
