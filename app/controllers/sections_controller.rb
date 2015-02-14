class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sections = Section.all
    respond_with(@sections)
  end

  def show
    @ranks = @section.ranks.order(:index)
    @unranked = students_without_rank
    @autogds = @section.season.students.select { |s| s.automatic_gds(@section.season) }
    session[:return_to] ||= request.referer
    respond_with(@section)
  end

  def new
    @section = Section.new
    respond_with(@section)
  end

  def edit
    @ranks = @section.ranks.order(:index)
  end

  def create
    @section = Section.new(section_params)
    @section.save
    respond_with(@section)
  end

  def update
    @section.update(section_params)
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

  private
    def students_without_rank
      rankless = @section.students.where(:archive => false).order(:last_name, :first_name)
      @section.ranks.each { |rank| rankless -= rank.students }
      rankless
    end

    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:name, :season_id,
                                     ranks_attributes:
                                     [ :id,
                                       :_destroy,
                                       :index,
                                       :name])
    end
end
