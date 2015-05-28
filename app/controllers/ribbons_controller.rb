class RibbonsController < ApplicationController
  before_action :check_permissions, except: [:permissions_error]
  before_action :set_ribbon, only: [:edit, :update]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Ribbons", :ribbons_path

  respond_to :html

  def permissions_error
  end

  def index
    @ribbons = Ribbon.rank(:index).all
    respond_with(@ribbons)
  end

  def new
    add_breadcrumb "New", :new_ribbon_path
    @ribbon = Ribbon.new
    respond_with(@ribbon)
  end

  def edit
    add_breadcrumb "Edit", :edit_ribbon_path
  end

  def create
    @ribbon = Ribbon.new(ribbon_params)
    @ribbon.update_attribute :index_position, :last
    @ribbon.save
    redirect_to ribbons_path
  end

  def update
    @ribbon.update(ribbon_params)
    redirect_to ribbons_path
  end

  def toggle_hidden
    r = Ribbon.find(params["ribbon_id"])
    r.hidden = !r.hidden
    r.save
    render :nothing => true
  end

  def update_row_order
    r = Ribbon.find(params["ribbon"]["ribbon_id"])
    r.update_attribute :index_position, params["ribbon"]["row_order_position"]
    render nothing: true
  end

  private
    def set_ribbon
      @ribbon = Ribbon.find(params[:id])
    end

    def ribbon_params
      params.require(:ribbon).permit(:name, :description, :hidden, :index)
    end

    def check_permissions
      if current_user.check_permissions(:edit_records)
      else
        redirect_to ribbons_permissions_error_path
      end
    end
end
