class ReleasesController < ApplicationController
  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @releases }
    end
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
    @release = Release.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @release }
    end
  end

  # GET /releases/new
  # GET /releases/new.json
  def new
    @release = Release.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @release }
    end
  end

  # GET /releases/1/edit
  def edit
    @release = Release.find(params[:id])
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = Release.new(params[:release])

    respond_to do |format|
      if @release.save
        format.html { redirect_to @release, notice: 'Release was successfully created.' }
        format.json { render json: @release, status: :created, location: @release }
      else
        format.html { render action: "new" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /releases/1
  # PUT /releases/1.json
  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    respond_to do |format|
      format.html { redirect_to releases_url }
      format.json { head :no_content }
    end
  end

  def send_quiz_to_user
    @email = User.find(params[:id]).email
    puts "Email: #{@email} for id #{params[:id]}"

    smtp = {:address => 'smtp.gmail.com', 
            :port => 465, 
            :domain => 'gmail.com', 
            :user_name => 'ljrpicasso@gmail.com', 
            :password => 'emerald05', 
            :enable_starttls_auto => true, :openssl_verify_mode => 'none' }
    Mail.defaults { delivery_method :smtp, smtp }

    mail = Mail.new do
      from    'ruby.quiz@gettyimages.com'
      to      "john.ribar@gettyimages.com"
      subject "Here's the current RubyQuiz"
      body    <<-eos
        Dummy Quiz
        Released: 2013-02-01
        Due by: 2013-02-15
        <b><i>3 Days to Go!</i></b>
    Bacon ipsum dolor sit amet doner in ham hock flank ut. Deserunt pork belly magna tri-tip, sausage doner cupidatat pork chop spare ribs eu brisket ut. Reprehenderit beef ribs capicola spare ribs, dolore meatloaf shankle. Short loin commodo qui pastrami.

    Swine nostrud reprehenderit ground round minim leberkas. Tri-tip ribeye esse turducken chuck elit. Proident tenderloin irure cow chuck, reprehenderit enim ribeye culpa fugiat. In tail cillum, t-bone aliqua pork chop tempor swine. Shank laboris ea, spare ribs jerky drumstick quis cillum duis enim tenderloin eu ullamco.

    Ullamco shoulder pork sausage pancetta dolor qui spare ribs consectetur. Commodo tail consectetur tongue, in cillum fugiat fatback pancetta tempor quis elit pork loin ut. Salami consectetur nisi swine, sint jowl chuck kielbasa prosciutto aliqua in enim fatback. Irure t-bone tongue, quis brisket ullamco fugiat ribeye. Sint ut ham aliquip shoulder nostrud deserunt voluptate pork loin. Officia incididunt adipisicing turkey.

              eos
    end
    mail.deliver!
  end
end
