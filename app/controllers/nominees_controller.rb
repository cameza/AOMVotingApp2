class NomineesController < ApplicationController
  before_action :set_nominee, only: [:show, :edit, :update, :destroy]

  # GET /nominees
  # GET /nominees.json
  def index
    @nominees = Nominee.all
  end

  def candidate_selection
    @nominees = Nominee.all
  end

  def chairman_selection
    @nominees = Nominee.all
  end

  def fellows_vote
    @nominees = Nominee.all
    @votes = Vote.all
    @members = Member.all

    if params[:nominee] == nil
      puts "is empty"
    end
    @theVote = ""
    if !params[:vote_id].to_s.empty? && params[:vote_id]!= nil
      @theVote = params[:vote_id].to_s.split("_")
      @nomID = @theVote[0]
      @voteType = @theVote[1]
      puts "vote id is #{@theVote}"
      puts @nomID
      puts @voteType

      # Update the vote for the current Nominee
      if @voteType == "1"
        puts "update type 1 vote"

      end

    end

  end

  def get_nom_id(voteid) 
    voteid_array = voteid.to_s.split("_")
    return voteid_array[0]
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
