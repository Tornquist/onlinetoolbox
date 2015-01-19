class RecruitStatusesController < ApplicationController
  before_action :set_recruit_status, only: [:show, :edit, :update, :destroy]

  # GET /recruit_statuses
  # GET /recruit_statuses.json
  def index
    @recruit_statuses = RecruitStatus.all
  end

  # GET /recruit_statuses/1
  # GET /recruit_statuses/1.json
  def show
  end

  # GET /recruit_statuses/new
  def new
    @recruit_status = RecruitStatus.new
  end

  # GET /recruit_statuses/1/edit
  def edit
  end

  # POST /recruit_statuses
  # POST /recruit_statuses.json
  def create
    @recruit_status = RecruitStatus.new(recruit_status_params)

    respond_to do |format|
      if @recruit_status.save
        format.html { redirect_to @recruit_status, notice: 'Recruit status was successfully created.' }
        format.json { render :show, status: :created, location: @recruit_status }
      else
        format.html { render :new }
        format.json { render json: @recruit_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recruit_statuses/1
  # PATCH/PUT /recruit_statuses/1.json
  def update
    respond_to do |format|
      if @recruit_status.update(recruit_status_params)
        format.html { redirect_to @recruit_status, notice: 'Recruit status was successfully updated.' }
        format.json { render :show, status: :ok, location: @recruit_status }
      else
        format.html { render :edit }
        format.json { render json: @recruit_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recruit_statuses/1
  # DELETE /recruit_statuses/1.json
  def destroy
    @recruit_status.destroy
    respond_to do |format|
      format.html { redirect_to recruit_statuses_url, notice: 'Recruit status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit_status
      @recruit_status = RecruitStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruit_status_params
      params.require(:recruit_status).permit(:name, :hidden)
    end
end
