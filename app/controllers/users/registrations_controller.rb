class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  def all_users
    add_breadcrumb "Settings", :edit_user_registration_path
    add_breadcrumb "Users", :all_users_path
    @users = User.all.order(:last_name, :first_name)
  end

  def generate_new
    add_breadcrumb "Settings", :edit_user_registration_path
    add_breadcrumb "Users", :all_users_path
    add_breadcrumb "New", :new_custom_user_path
    @user = User.new
  end

  def create_new
    user = params["user"].permit("first_name","last_name","email","password","password_confirmation","admin","recruiter","student_leader","chief_of_staff","director")
    u = User.create(user)
    flash[:notice] = "Please verify results"
    redirect_to all_users_path
  end

  def ban
    user = User.find(params["id"])
    flash[:notice] = "Toggled User Ban for #{user.full_name}"
    user.update(banned: !user.banned)
    redirect_to all_users_path
  end

  def edit_permissions
    add_breadcrumb "Settings", :edit_user_registration_path
    add_breadcrumb "Users", :all_users_path
    add_breadcrumb "Permissions", :new_custom_user_path
    @user = User.find(params["id"])
  end

  def save_permissions
    user_params = params["user"].permit("admin","recruiter","student_leader","chief_of_staff","director")
    user = User.find(params["id"])
    user.update(user_params)
    flash[:notice] = "Permissions for #{user.full_name} updated"
    redirect_to all_users_path
  end

  def reset_password
    add_breadcrumb "Settings", :edit_user_registration_path
    add_breadcrumb "Users", :all_users_path
    add_breadcrumb "Password Reset", :reset_user_password_path
    @user = User.find(params["id"])
    @newpass = rand(36**8).to_s(36)
    @user.update(password: @newpass, password_confirmation: @newpass)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    add_breadcrumb "Settings", :edit_user_registration_path
    add_breadcrumb "Edit User", :edit_user_registration_path
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
