class RegistrationController < Devise::RegistrationsController
  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.address = params[:user][:address]
    @user.role = params[:role] 
    @user.address = params[:user][:phone]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation] 

    @user.valid?
    if @user.errors.blank?

      @user.save
      redirect_to new_user_session_path
    else
      render :action => "new"
    end
  end
end
