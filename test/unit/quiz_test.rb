require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Quiz.new.valid?
  end
end
