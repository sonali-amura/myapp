class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]
  # GET /advertises
  # GET /advertises.json
  def index
    @user = User.find(params[:user_id])
    @advertises = @user.advertises.all
  end

  # GET /advertises/1
  # GET /advertises/1.json
  def show
  end

  # GET /advertises/new
  def new
    @advertise = Advertise.new
  end

  # GET /advertises/1/edit
  def edit
  end

  # POST /advertises
  # POST /advertises.json
  def create
   
    @user = User.find(params[:user_id])
    @advertise = Advertise.new(advertise_params)

    if @advertise.save
       redirect_to user_path(@user), notice: 'Advertise was successfully created.'
       
    end
  end

  # PATCH/PUT /advertises/1
  # PATCH/PUT /advertises/1.json
  def update
    respond_to do |format|
      if @advertise.update(advertise_params)
        format.html { redirect_to @advertise, notice: 'Advertise was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertise }
      else
        format.html { render :edit }
        format.json { render json: @advertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertises/1
  # DELETE /advertises/1.json
  def destroy
    @advertise.destroy
    respond_to do |format|
      format.html { redirect_to advertises_url, notice: 'Advertise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertise_params
      data = params.require(:advertise).permit(:id, :title, :description, :started_at, :expiry_date, :category, :location, :area)
        data.store(:user_id,current_user.id)
        data
    end
end
