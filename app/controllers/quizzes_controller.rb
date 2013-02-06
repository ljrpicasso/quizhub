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

    # :conditions => ["loc.updated_at < ?", params[:date]],
    if archived == 1 then
      conditions = "archived = true"
    end

    if conditions.blank?
      @quizzes = Quiz.paginate(:page => params[:page], 
                               :per_page => 10,
                               :order => order)
    else
      @quizzes = Quiz.paginate(:page => params[:page], 
                               :per_page => 10,
                               :order => order,
                               :conditions => ["#{conditions}"] )
    end

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

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def activate
    @quiz = Quiz.find(params[:id])
    @quiz.active = false
    @quiz.update_attribute :points, @quiz.active
    @quiz.save

    Release.all.update_attribute :active, false
    @release = Release.new
    @release.release_date = Date.today
    @release.due_date = Date.today + 7
    @release.active = true
    @release.quiz_id = params[:id]
    @release.released_by = current_user.id
    @release.save

    render :action => 'show'
  end

  def show
    @quiz = Quiz.find(params[:id])
    @release = Release.find_by_quiz_id(@quiz.id)    
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
    @quiz = Quiz.find(params[:id])
    respond_to do |format|
      format.html {
        if @quiz.update_attributes(params[:quiz])
          redirect_to @quiz, notice: 'Quiz was successfully updated.'
        else
          render action: "edit"
        end
      }
      format.js {
        new_points = @quiz.points + params[:point].to_i if params[:point] =~ /[+|-]?1/
        @quiz.update_attribute :points, new_points
        @quiz_points = new_points
        @quiz_id = @quiz.id
      }
    end
  end

end
