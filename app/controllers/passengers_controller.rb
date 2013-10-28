class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /passengers
  def index
    @passengers = Passenger.all
    user = User.where("lower(name) like ?", "%#{params[:q].downcase}%").select("id, name as name") if params[:q]
    respond_to do |format|
     format.json { render json: user }
   end

  end

  # GET /passengers/1
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  def create
   user_ids = params[:users].split(",").reject(&:empty?)
   users = User.where("id IN(?)" , user_ids)
   user_lists = []
    users.each do |user_id|
     @passenger = Passenger.create(passenger_params)
     @passenger.user_id = user_id.id
     user_lists << @passenger.user.name
 	  end
     if @passenger.save
    	  redirect_to vehicles_path, notice: 'successfully added.'
  	 else
   			redirect_to vehicles_path, notice: 'something went wrong !'
     end
  end

  # PATCH/PUT /passengers/1
  def update
    if @passenger.update(passenger_params)
      redirect_to @passenger, notice: 'Passenger was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /passengers/1
  def destroy
    @passenger.destroy
    redirect_to passengers_url, notice: 'Passenger was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def passenger_params
      params.require(:passenger).permit(:user_id, :vehicle_id)
    end
end
