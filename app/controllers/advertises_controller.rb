class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @advertises = @user.advertises.all
    @adv = Advertise.all
  end

  def show
  end

  def new
    @advertise = Advertise.new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @advertise = Advertise.new(advertise_params)
    @advertise.avatar =  params[:advertise][:avatar]
    @advertise.creator = current_user.id.to_s
    if @advertise.save
       redirect_to user_path(@user), notice: 'Advertise was successfully created.'      
    end
  end

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

  def destroy
    @advertise.destroy
    respond_to do |format|
      format.html { redirect_to advertises_url, notice: 'Advertise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def image
    content = @advertise.image.read
    if stale?(etag: content, last_modified: @advertise.updated_at.utc, public: true)
      send_data content, type: @advertise.image.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

  private
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    def advertise_params
      data = params.require(:advertise).permit(:id, :title, :description, :started_at, :expiry_date, :category, :location, :area)
      data.store(:user_id,current_user.id)
      data
    end
end
