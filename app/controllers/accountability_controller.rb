class AccountabilityController < ApplicationController
  add_breadcrumb "Accountability", :accountability_path
  def index
    @users = User.where(recruiter:true).order(:last_name, :first_name)
  end

  def details
    @user = User.find(params[:id])
    @name = [@user.first_name, @user.last_name].reject {|u| u.empty?}.join(" ")
    add_breadcrumb @name, accountability_details_path(params[:id])

    @students = @user.students.order(:last_name, :first_name)
    @comments = @user.comments.order(:created_at).reverse
  end
end
