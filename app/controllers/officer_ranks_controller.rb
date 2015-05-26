class OfficerRanksController < ApplicationController
  before_action :set_officer_rank, only: [:edit, :update]

  add_breadcrumb "Settings", :edit_user_registration_path
  add_breadcrumb "Officer Ranks", :officer_ranks_path

  respond_to :html

  def index
    @officer_ranks = OfficerRank.order(:hours).all
    respond_with(@officer_ranks)
  end


  def new
    add_breadcrumb "New", :new_officer_rank_path
    @officer_rank = OfficerRank.new
    respond_with(@officer_rank)
  end

  def edit
    add_breadcrumb "Edit", :edit_officer_rank_path
  end

  def create
    @officer_rank = OfficerRank.new(officer_rank_params)
    @officer_rank.hours ||= 0
    @officer_rank.inventory ||= 0
    @officer_rank.save
    redirect_to officer_ranks_path
  end

  def update
    @officer_rank.update(officer_rank_params)
    @officer_rank.hours ||= 0
    @officer_rank.inventory ||= 0
    @officer_rank.save
    redirect_to officer_ranks_path
  end

  def destroy
    @officer_rank.destroy
    respond_with(@officer_rank)
  end

  private
    def set_officer_rank
      @officer_rank = OfficerRank.find(params[:id])
    end

    def officer_rank_params
      params.require(:officer_rank).permit(:name, :hours, :inventory)
    end
end
