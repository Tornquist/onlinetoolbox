class OfficesController < ApplicationController
  before_action :check_permissions, except: [:permissions_error]
  before_action :set_office, only: [:edit, :update]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Offices", :offices_path

  respond_to :html

  def index
    @offices = Office.order(:name)
    respond_with(@offices)
  end

  def new
    add_breadcrumb "New", :new_office_path
    @office = Office.new
    respond_with(@office)
  end

  def edit
  end

  def create
    @office = Office.new(office_params)
    @office.save
    redirect_to offices_path
  end

  def update
    add_breadcrumb "Edit", :edit_office_path
    @office.update(office_params)
    redirect_to offices_path
  end

  def toggle_hidden
    r = Office.find(params["office_id"])
    r.hidden = !r.hidden
    r.save
    render :nothing => true
  end

  private
    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:name, :hidden)
    end

    def check_permissions
      if current_user.check_permissions(:edit_records)
      else
        redirect_to offices_permissions_error_path
      end
    end
end
