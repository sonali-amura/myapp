class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  before_action :authorize_user!
  before_action :set_user, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
