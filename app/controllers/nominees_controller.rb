class NomineesController < ApplicationController
  before_action :set_nominee, only: [:show, :edit, :update, :destroy]

  # GET /nominees
  # GET /nominees.json
  def index
    @nominees = Nominee.all
  end

  # GET /candidate_selection
  def candidate_selection
    @nominees = Nominee.all
  end

  # GET /chairman_selection
  def chairman_selection
    @nominees = Nominee.all
  end

  # GET/POST /fellows_vote
  def fellows_vote
    # initializers
    @nominees = Nominee.all
    @votes = Vote.all
    @members = Member.all
    @isValid = false
    @voted = false

    puts "here #{params["email"]}" #debugging
    mail = params["email"] #email inputted by the user

    # visit every member to see if the email mathes a member
    @members.each do |member|
      # Case in which the email is validated
      if member.mail.eql?(mail)
        # Email was validated and member has not voted yet
        # The email is added to the @votedArray
        puts "------------- mail is valid --------------"
        if member.voted == nil
          @isValid = true
          member.update(:voted => true)
          puts "------------- mail hasnt voted --------------"
        else
          # Email was validated but member had already voted
          @isValid = true
          @voted = true
          puts "------------- mail has voted --------------"
        end
      end
    end
  end

  # GET /results
  def results
    @nominees = Nominee.all
    @votes = Vote.all
    @members = Member.all
    @votersCount = 0

    # Get the total number of members who voted
    @members.each do |member|
      if member.voted
        @votersCount += 1
      end
    end
  end

  # GET /nominees/1
  # GET /nominees/1.json
  def show
  end

  # GET /nominees/new
  def new
    @nominee = Nominee.new
  end

  # GET /nominees/1/edit
  def edit
  end

  # POST /nominees
  # POST /nominees.json
  def create
    @nominee = Nominee.new(nominee_params)

    respond_to do |format|
      if @nominee.save
        format.html { redirect_to @nominee, notice: 'Nominee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nominee }
        #format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominees/1
  # PATCH/PUT /nominees/1.json
  def update
    
    @nominees = Nominee.all

    # Update the nominee check count
    @check = "0"
    @check = params[:nominee]["committee_check"].to_i
    puts "nominee id: #{@nominee.id}"
    puts "check count: #{@nominee.committee_check_count}"
    puts "Check = #{@check} "
    if @check == 1
      if @nominee.committee_check_count == nil
        @nominee.committee_check_count = 1
      else
        @nominee.committee_check_count += 1
      end
      puts "check count: #{@nominee.committee_check_count}"
    end

    # Update the nominee vote count
    @voted = params[:nominee]["vote_id"].to_i
    if @voted > 0
      puts "vote id = #{@voted} and nominee id = #{params[:id]}"
      myNom = Nominee.find_by_id(params[:id].to_i)
      puts "nominee.confirmed = #{myNom}"
      # Confirmed vote
      if @voted == 1
        if myNom["confirmed"] == nil
          Nominee.update(params[:id].to_i, :confirmed => 1)
        else
          count = myNom["confirmed"] + 1
          Nominee.update(params[:id].to_i, :confirmed => count)
        end
      end

      # Not Confirmed vote
      if @voted == 2
        if myNom["not_confirmed"] == nil
          Nominee.update(params[:id].to_i, :not_confirmed => 1)
        else
          count = myNom["not_confirmed"] + 1
          Nominee.update(params[:id].to_i, :not_confirmed => count)
        end
      end

      # Abstained vote - this column is of type string
      if @voted == 3
        if myNom["abstained"] == nil
          Nominee.update(params[:id].to_i, :abstained => 1.to_s)
        else
          count = myNom["abstained"].to_i + 1
          Nominee.update(params[:id].to_i, :abstained => count.to_s)
        end
      end
    end

    respond_to do |format|
      if @nominee.update(nominee_params)
        format.html { redirect_to @nominee, notice: 'Nominee was successfully updated.' }
        format.json { head :no_content }
        format.js {}
      else
        format.html { render action: 'edit' }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end

    

  end

  # DELETE /nominees/1
  # DELETE /nominees/1.json
  def destroy
    @nominee.destroy
    respond_to do |format|
      format.html { redirect_to nominees_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nominee
      @nominee = Nominee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nominee_params
      params.require(:nominee).permit(:nominator_mail, :member_id, :mail, :name, :cv, :statement, :committee_check, :committee_check_count, :chairman_check, :confirmed, :not_confirmed, :abstained, :id, :vote_id)
    end
end
