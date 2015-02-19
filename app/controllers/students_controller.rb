class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy, :sections]

  # GET /students
  # GET /students.json
  def index
    @claimed_students = current_user.students
    @unclaimed_students = (StudentsHelper.UnclaimedRecruits - Student.where(archive: true)).select { |student| (current_user.instruments - student.instruments).size != current_user.instruments.size }
    session[:return_to] ||= request.referer
  end

  def unclaimed
    @unclaimed_students = (StudentsHelper.UnclaimedRecruits - Student.where(archive: true))
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @show_buttons = false
  end

  # GET /students/new
  def new
    @student = Student.new
    1.times { @student.student_instruments.build }
    Field.where(group_id: Group.where(name: "Text").first).each do |f|
      @student.texts.build(field_id: f.id)
    end
    Field.where(group_id: Group.where(name: "Address").first).each do |f|
      @student.addresses.build(field_id: f.id)
    end
    Field.where(group_id: Group.where(name: "Option").first).each do |f|
      @student.options.build(field_id: f.id)
    end

    @show_buttons = true
  end

  # GET /students/1/edit
  def edit
    Field.where(group_id: Group.where(name: "Text").first).each do |f|
      if !@student.fields.include?(f)
        @student.texts.build(field_id: f.id)
      end
    end
    Field.where(group_id: Group.where(name: "Address").first).each do |f|
      if !@student.fields.include?(f)
        @student.addresses.build(field_id: f.id)
      end
    end
    Field.where(group_id: Group.where(name: "Option").first).each do |f|
      if !@student.fields.include?(f)
        @student.options.build(field_id: f.id)
      end
    end

    @show_buttons = true
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def sections
  end

  def claim
    ClaimedStudent.create(student_id: params["student_id"], user_id: current_user.id)
    redirect_to students_path
  end

  def unclaim
    ClaimedStudent.where(student_id: params["student_id"], user_id: current_user.id).destroy_all
    redirect_to students_path
  end

  def archive
    Student.update(params["student_id"], archive: true)
    ClaimedStudent.where(student_id: params["student_id"], user_id: current_user.id).destroy_all
    redirect_to session.delete(:return_to)
  end

  def import
    if params[:file]
      @student_objects = StudentsHelper.import(params[:file])
      session[:student_objects] = @student_objects
      flash[:notice] = "Notice: Review Processed Student Data"
      render :upload
      #render import_students_path, notice: "Students Imported"
    else
      flash[:error] = "Error: No File Selected"
      redirect_to import_students_path
    end
  end

  def import_finalize
    StudentsHelper.import_save_result(session[:student_objects])
    session.delete(:student_objects)
    flash[:notice] = "Info: Students Imported"
    redirect_to students_path
  end

  def upload
  end

  def search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :recruit,
                                      student_instruments_attributes:
                                        [:student_id,
                                         :ensemble_id,
                                         :instrument_id,
                                         :id,
                                         :_destroy],
                                      texts_attributes:
                                        [:student_id,
                                         :field_id,
                                         :id,
                                         :content],
                                      addresses_attributes:
                                        [:id,
                                         :student_id,
                                         :field_id,
                                         :address_1,
                                         :address_2,
                                         :city,
                                         :state_id,
                                         :zip],
                                     options_attributes:
                                      [:id,
                                       :student_id,
                                       :field_id,
                                       :choice],
                                     section_members_attributes:
                                      [:id,
                                       :student_id,
                                       :section_id,
                                       :_destroy]
                                     )
    end
end
