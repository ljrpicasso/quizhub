class AddFlagsToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :archived, :boolean
    add_column :quizzes, :active, :boolean
  end
end
