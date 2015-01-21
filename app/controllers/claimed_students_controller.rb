class ClaimedStudentsController < ApplicationController
  before_action :set_claimed_student, only: [:show, :edit, :update, :destroy]

  # GET /claimed_students
  # GET /claimed_students.json
  def index
    @claimed_students = ClaimedStudent.all
  end

  # GET /claimed_students/1
  # GET /claimed_students/1.json
  def show
  end

  # GET /claimed_students/new
  def new
    @claimed_student = ClaimedStudent.new
  end

  # GET /claimed_students/1/edit
  def edit
  end

  # POST /claimed_students
  # POST /claimed_students.json
  def create
    @claimed_student = ClaimedStudent.new(claimed_student_params)

    respond_to do |format|
      if @claimed_student.save
        format.html { redirect_to @claimed_student, notice: 'Claimed student was successfully created.' }
        format.json { render :show, status: :created, location: @claimed_student }
      else
        format.html { render :new }
        format.json { render json: @claimed_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claimed_students/1
  # PATCH/PUT /claimed_students/1.json
  def update
    respond_to do |format|
      if @claimed_student.update(claimed_student_params)
        format.html { redirect_to @claimed_student, notice: 'Claimed student was successfully updated.' }
        format.json { render :show, status: :ok, location: @claimed_student }
      else
        format.html { render :edit }
        format.json { render json: @claimed_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claimed_students/1
  # DELETE /claimed_students/1.json
  def destroy
    @claimed_student.destroy
    respond_to do |format|
      format.html { redirect_to claimed_students_url, notice: 'Claimed student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claimed_student
      @claimed_student = ClaimedStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claimed_student_params
      params.require(:claimed_student).permit(:student_id, :user_id)
    end
end
