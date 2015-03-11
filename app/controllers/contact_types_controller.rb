class ContactTypesController < ApplicationController
  before_action :set_contact_type, only: [:edit, :update, :destroy]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Contact Types", :contact_types_path

  def index
    @contact_types = ContactType.all.order(:name)
  end

  def new
    @contact_type = ContactType.new
    add_breadcrumb "New", :new_contact_type_path
  end

  def edit
    add_breadcrumb "Edit", :edit_contact_type_path
  end

  def create
    @contact_type = ContactType.new(contact_type_params)

    if @contact_type.save
      flash[:notice] = "Contact type successfully created"
      redirect_to contact_types_path
    else
      render :new
    end
  end

  def update
    if @contact_type.update(contact_type_params)
      flash[:notice] = "Contact type successfully updated"
      redirect_to contact_types_path
    else
      render :edit
    end
  end

  def destroy
    if @contact_type.comments.size > 0
      flash[:error] = "Cannot delete contact types with associated comments.  Delete comments, or hide contact type"
    else
      @contact_type.destroy
      flash[:notice] = "Contact type successfully destroyed"
    end
    redirect_to contact_types_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_type
      @contact_type = ContactType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_type_params
      params.require(:contact_type).permit(:name, :hidden)
    end
end
