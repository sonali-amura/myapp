class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  before_action :authorize_user!
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json {render json: @users}
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html
        format.json {render json: @user}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      data = params.require(:user).permit(:name, :address, :email, :phone, :role)
      data
    end
end
