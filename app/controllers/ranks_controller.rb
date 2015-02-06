class RanksController < ApplicationController
  before_action :set_rank, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ranks = Rank.all
    respond_with(@ranks)
  end

  def show
    respond_with(@rank)
  end

  def new
    @rank = Rank.new
    respond_with(@rank)
  end

  def edit
  end

  def create
    @rank = Rank.new(rank_params)
    @rank.save
    respond_with(@rank)
  end

  def update
    @rank.update(rank_params)
    respond_with(@rank)
  end

  def destroy
    @rank.destroy
    respond_with(@rank)
  end

  private
    def set_rank
      @rank = Rank.find(params[:id])
    end

    def rank_params
      params.require(:rank).permit(:section_id, :name, :index)
    end
end
