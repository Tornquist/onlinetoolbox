class StudentRibbonsController < ApplicationController
  before_action :set_student_ribbon, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @student_ribbons = StudentRibbon.all
    respond_with(@student_ribbons)
  end

  def show
    respond_with(@student_ribbon)
  end

  def new
    @student_ribbon = StudentRibbon.new
    respond_with(@student_ribbon)
  end

  def edit
  end

  def create
    @student_ribbon = StudentRibbon.new(student_ribbon_params)
    @student_ribbon.save
    respond_with(@student_ribbon)
  end

  def update
    @student_ribbon.update(student_ribbon_params)
    respond_with(@student_ribbon)
  end

  def destroy
    @student_ribbon.destroy
    respond_with(@student_ribbon)
  end

  private
    def set_student_ribbon
      @student_ribbon = StudentRibbon.find(params[:id])
    end

    def student_ribbon_params
      params.require(:student_ribbon).permit(:student_id, :ribbon_id)
    end
end
