class StudentInstrumentsController < ApplicationController
  before_action :set_student_instrument, only: [:show, :edit, :update, :destroy]

  # GET /student_instruments
  # GET /student_instruments.json
  def index
    @student_instruments = StudentInstrument.all
  end

  # GET /student_instruments/1
  # GET /student_instruments/1.json
  def show
  end

  # GET /student_instruments/new
  def new
    @student_instrument = StudentInstrument.new
  end

  # GET /student_instruments/1/edit
  def edit
  end

  # POST /student_instruments
  # POST /student_instruments.json
  def create
    @student_instrument = StudentInstrument.new(student_instrument_params)

    respond_to do |format|
      if @student_instrument.save
        format.html { redirect_to @student_instrument, notice: 'Student instrument was successfully created.' }
        format.json { render :show, status: :created, location: @student_instrument }
      else
        format.html { render :new }
        format.json { render json: @student_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_instruments/1
  # PATCH/PUT /student_instruments/1.json
  def update
    respond_to do |format|
      if @student_instrument.update(student_instrument_params)
        format.html { redirect_to @student_instrument, notice: 'Student instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_instrument }
      else
        format.html { render :edit }
        format.json { render json: @student_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_instruments/1
  # DELETE /student_instruments/1.json
  def destroy
    @student_instrument.destroy
    respond_to do |format|
      format.html { redirect_to student_instruments_url, notice: 'Student instrument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_instrument
      @student_instrument = StudentInstrument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_instrument_params
      params.require(:student_instrument).permit(:student_id, :instrument_id, :ensemble_id)
    end
end
