class SectionMembersController < ApplicationController
  before_action :set_section_member, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @section_members = SectionMember.all
    respond_with(@section_members)
  end

  def show
    respond_with(@section_member)
  end

  def new
    @section_member = SectionMember.new
    respond_with(@section_member)
  end

  def edit
  end

  def create
    @section_member = SectionMember.new(section_member_params)
    @section_member.save
    respond_with(@section_member)
  end

  def update
    @section_member.update(section_member_params)
    respond_with(@section_member)
  end

  def destroy
    @section_member.destroy
    respond_with(@section_member)
  end

  private
    def set_section_member
      @section_member = SectionMember.find(params[:id])
    end

    def section_member_params
      params.require(:section_member).permit(:student_id, :section_id)
    end
end
