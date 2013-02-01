class QuizzesController < ApplicationController
  def index
    ordering = params[:order] || 'hot'
    order = case ordering
            when 'hot' then 'points DESC'
            when 'new' then 'created_at DESC'
            end
    #@quiz_pages, @quizzes = paginate :quizzes, :order => order, :per_page => 20
    @quizzes = Quiz.all(:order => order)
    @header_text = case ordering
                   when 'hot' then 'Top rated submissions'
                   when 'new' then 'Latest submissions'
                   end
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to quizzes_url, :notice => "Successfully created quiz."
    else
      render :action => 'new'
    end
  end

  def update
    respond_to do |format|
      format.js {
        quiz = Quiz.find(params[:id])
        new_points = quiz.points + params[:point].to_i if params[:point] =~ /[+|-]?1/
        quiz.update_attribute :points, new_points
        @quiz_points = new_points
        @quiz_id = quiz.id
      }
    end
  end

end
