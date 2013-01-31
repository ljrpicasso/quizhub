class QuizzesController < ApplicationController
  def index
    #@quizzes = Quiz.all
    submissions
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

  def submissions
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

  def modify_points
    @quiz = Quiz.find(params[:id])
    @quiz.update_attribute :points, @quiz.points + params[:by].to_i #if params[:by] =~ /[+|-]?1/
    render_text @quiz.points
  end
end
