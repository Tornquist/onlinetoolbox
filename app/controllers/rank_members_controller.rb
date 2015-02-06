class RankMembersController < ApplicationController
  before_action :set_rank_member, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rank_members = RankMember.all
    respond_with(@rank_members)
  end

  def show
    respond_with(@rank_member)
  end

  def new
    @rank_member = RankMember.new
    respond_with(@rank_member)
  end

  def edit
  end

  def create
    @rank_member = RankMember.new(rank_member_params)
    @rank_member.save
    redirect_to section_path(@rank_member.rank.section)
  end

  def update
    rank_id = rank_member_params[:rank_id]
    section = nil
    if rank_id.blank?
      section = @rank_member.rank.section
    else
      section = Rank.find(rank_id).section
    end
    @rank_member.update(rank_member_params)
    redirect_to section_path(section)
  end

  def destroy
    @rank_member.destroy
    redirect_to section_path(@rank_member.rank.section)
  end

  private
    def set_rank_member
      @rank_member = RankMember.find(params[:id])
    end

    def rank_member_params
      params.require(:rank_member).permit(:rank_id, :student_id)
    end
end
