class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :sections]

  add_breadcrumb "Students", :students_path

  # GET /students
  # GET /students.json
  def index
    @claimed_students = StudentsHelper.sort(current_user.students.includes(:texts, :addresses, :comments))
    @unclaimed_students = Student.includes(:texts, :addresses, :student_instruments).where(archive: false, recruit: true) - ClaimedStudent.claimed
    instrument_ids = current_user.instruments.map(&:id)
    @unclaimed_students = @unclaimed_students.select { |student| student.student_instruments.map{|a| instrument_ids.include?(a.instrument_id)}.any? }
    @unclaimed_students = StudentsHelper.sort(@unclaimed_students)
    session[:return_to] ||= request.referer
  end

  def unclaimed
    add_breadcrumb "Unclaimed Students", :unclaimed_students_path
    @unclaimed_students = StudentsHelper.sort(Student.includes(:texts, :options, :addresses, :student_instruments).where(archive: false, recruit: true) - ClaimedStudent.claimed)
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @show_buttons = false
  end

  # GET /students/new
  def new
    add_breadcrumb "New", :new_student_path
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
    add_breadcrumb "#{@student.full_name}", edit_student_path(@student.id)
    add_breadcrumb "Edit", edit_student_path(@student.id)

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
        format.html { redirect_to edit_student_path(@student), notice: 'Student was successfully created.' }
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
    begin
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    rescue
      flash[:error] = "Error: Unable to Update Student"
      redirect_to :back
    end
  end

  def sections
    add_breadcrumb "#{@student.full_name}", edit_student_path(@student.id)
    add_breadcrumb "Sections", :sections_student_path, :id => @student.id
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

  def unarchive
    Student.update(params["student_id"], archive: false)
    redirect_to students_path
  end

  def import
    add_breadcrumb "Import", :import_students_path
    add_breadcrumb "Confirm", :import_students_path
    if params[:file]
      @student_objects = StudentsHelper.import(params[:file])
      if (@student_objects == "COUNT" || @student_objects.size > 100)
        flash[:error] = "Error: More than 100 entries in CSV"
        redirect_to :back
      else
        session[:student_objects] = @student_objects
        flash[:notice] = "Notice: Review Processed Student Data"
        render :upload
      end
      #render import_students_path, notice: "Students Imported"
    else
      flash[:error] = "Error: No File Selected"
      redirect_to import_students_path
    end
  end

  def import_finalize
    StudentsHelper.import_save_result(session[:student_objects], params.has_key?("autoclaim"), current_user)
    session.delete(:student_objects)
    flash[:notice] = "Info: Students Imported"
    redirect_to students_path
  end

  def upload
    add_breadcrumb "Import", :import_students_path
  end

  def search
    add_breadcrumb "Search", :search_students_path
    @students = [] #StudentsHelper.sort(Student.where(archive: false))
    @special_fields = ["Instruments", "Ensembles"]
    @fields = [2, 3, 5].map { |f| Field.find(f) }
    @large_filter = []

    @fields_all = Field.where(hidden:false).order(:index)
    @fields_top = @fields_all.limit(0)
    @fields_bottom = @fields_all - @fields_top
    @filters = {}
  end

  def search_terms
    add_breadcrumb "Search", :search_students_path
    @large_filter = params["large_filter"] ||= []
    @students = nil
    @large_filter.each do |search_item|
      if search_item.starts_with?('all')
        @students = @students.nil? ? Student.all : @students + Student.all.includes(:texts, :options, :addresses, :student_instruments)
      elsif search_item.starts_with?('season')
        newStudents = Season.find(search_item.split[1].to_i).students.includes(:texts, :options, :addresses, :student_instruments)
        @students = @students.nil? ? newStudents : @students + newStudents
      elsif search_item.starts_with?('section')
        newStudents = Section.find(search_item.split[1].to_i).students.includes(:texts, :options, :addresses, :student_instruments)
        @students = @students.nil? ? newStudents : @students + newStudents
      elsif search_item.starts_with?('rank')
        newStudents = Rank.find(search_item.split[1].to_i).students.includes(:texts, :options, :addresses, :student_instruments)
        @students = @students.nil? ? newStudents : @students + newStudents
      end
    end
    @students ||= []
    if params["search"]
      params["search"].each do |key, value|
        if !value.empty?
          field_id = key.to_i
          type = Field.find(field_id).group_id
          @students = @students.reject do |student|
            case type
            when 1 #address
              val = true
              student.addresses.each do |address|
                if (address.field_id == field_id)
                  val = !address.searchable.downcase.include?(value.downcase)
                end
              end
              val
              #!student.field(field_id).searchable.downcase.include?(value.downcase)
            when 2 #text
              val = true
              student.texts.each do |text|
                if (text.field_id == field_id)
                  val = !text.content.downcase.include?(value.downcase)
                end
              end
              val
              #!student.field(field_id).content.downcase.include?(value.downcase)
            when 3 #option
              val = true
              student.options.each do |option|
                if (option.field_id == field_id)
                  val = !option.content.downcase.include?(value.downcase)
                end
              end
              val
              #!student.field(field_id).choice.downcase.include?(value.downcase)
            end
          end
        end
      end
    end
    if params["search_instrument"]
      if !params["search_instrument"].empty?
        @students = @students.reject do |student|
          reject = true
          params["search_instrument"].downcase.split(",").each do |instrument|
            if student.instrument_list.downcase.include?(instrument.strip)
              reject = false
            end
          end
          #!student.instrument_list.downcase.include?(params["search_instrument"].downcase)
          reject
        end
      end
    end
    if params["search_ensemble"]
      if !params["search_ensemble"].empty?
        @students = @students.reject do |student|
          reject = true
          params["search_ensemble"].downcase.split(",").each do |ensemble|
            if student.ensemble_list.downcase.include?(ensemble.strip)
              reject = false
            end
          end
          #!student.ensemble_list.downcase.include?(params["search_ensemble"].downcase)
          reject
        end
      end
    end
    if params["special_fields"]
      if !params["special_fields"].empty?
        if !params["special_fields"].include?("Archive")
          @students = @students.reject do |student|
            student.archive
          end
        end
      end
    end

    @students = StudentsHelper.sort(@students.uniq)
    @fields = (params["fields"] ||= []).map(&:to_i).map { |f| Field.find(f) }
    @special_fields = params["special_fields"] ||= []

    @fields_all = Field.where(hidden:false).order(:index)
    @fields_top = @fields_all.limit(0)
    @fields_bottom = @fields_all - @fields_top

    @filters = {}
    @filters["ensembles"] = params["search_ensemble"] ||= ""
    @filters["instruments"] = params["search_instrument"] ||= ""
    if params["search"]
      params["search"].each do |key, value|
        @filters[key.to_i] = value
      end
    end
    render 'search'
  end

  def upload_template
    send_data StudentsHelper.import_template, :filename => 'online_toolbox_template.csv'
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
