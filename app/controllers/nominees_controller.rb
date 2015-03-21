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
    @check = params[:committee_check]
    @nominees = Nominee.all
    puts @nominee.id
    puts @nominee.committee_check_count
    if @nominee.committee_check_count == nil
      @nominee.committee_check_count = 1
    else
      @nominee.committee_check_count += 1
    end
    puts @nominee.committee_check_count

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
      params.require(:nominee).permit(:nominator_mail, :member_id, :mail, :name, :cv, :statement, :committee_check, :committee_check_count, :chairman_check, :confirmed, :not_confirmed, :abstained, :id)
    end
end
