class QuizzesController < ApplicationController
  before_filter :login_required, :except => [:index]
  
  def index
    archived = params[:archive] || '0' 
    archive_text = ' '
    archive_text = '[Archives]' if archived == '1'
    selected = params[:select] || 'all'
    @subheader_text = case selected
                      when 'all' then 'All Quizzes'
                      else "Only #{ params[:select] } quizzes"
                      end

    ordering = params[:order] || 'hot'
    order = case ordering
            when 'hot' then 'points DESC'
            when 'new' then 'created_at DESC'
            end
    @quizzes = Quiz.paginate(:page => params[:page], 
                             :per_page => 10,
                             :order => order)
    #@quizzes = Quiz.all(:order => order)
       #  .where("archived = #{archived == '1' ? 'true' : 'false'}") 
    @header_text = case ordering
                   when 'hot' then "Top rated submissions #{archive_text}"
                   when 'new' then "Latest submissions #{archive_text}"
                   end
  end

  def new
    @quiz = Quiz.new
    @quiz.points = 0
    @quiz.archived = false
    @quiz.active = false
    @quiz.source = current_user.username
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
