class FieldsController < ApplicationController
  before_action :check_permissions, except: [:permissions_error]
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Fields", :fields_path

  def permissions_error
  end

  # GET /fields
  # GET /fields.json
  def index
    @fields = all_fields
  end

  # GET /fields/1
  # GET /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    add_breadcrumb "New", :new_field_path
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
    add_breadcrumb "Edit", :edit_field_path
    if @field.locked
      flash[:error] = "That field is locked.  It cannot be modified"
      redirect_to request.referer
    end
  end

  # POST /fields
  # POST /fields.json
  def create
    @field = Field.new(field_params)
    @field.update_attribute :index_position, :last
    respond_to do |format|
      if @field.save
        format.html { redirect_to fields_path, notice: 'Field was successfully created.' }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1
  # PATCH/PUT /fields/1.json
  def update
    puts field_params
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to fields_path, notice: 'Field was successfully updated.' }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to fields_url, notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_row_order
    f = Field.find(params["field"]["field_id"])
    f.update_attribute :index_position, params["field"]["row_order_position"]
    render nothing: true
  end

  def toggle_hidden
    f = Field.find(params["field_id"])
    f.hidden = !f.hidden
    f.save
    render :nothing => true
  end

  private
    def all_fields
      Field.rank(:index).all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:field).permit(:name, :index, :group_id, :description, :options, :hidden, :locked)
    end

    def check_permissions
      if current_user.check_permissions(:edit_fields)
      else
        redirect_to fields_permissions_path
      end
    end
end
