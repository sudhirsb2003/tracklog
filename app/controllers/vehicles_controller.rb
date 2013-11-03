class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.order(:vehicle_make).includes(:user)
  end

  # GET /vehicles/1
  def show
   @vehicle = Vehicle.find(params[:id])
   @passengers = Passenger.new
   @passenger = Passenger.where(:vehicle_id => @vehicle.id).order(:user_id).includes(:user)
   @start_point = @vehicle.start_point.to_gmaps4rails
   @end_point = @vehicle.end_point.to_gmaps4rails
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicle_data = @vehicle.build_vehicle_data
    @vehicle_start_point = @vehicle.build_start_point
    @vehicle_end_point = @vehicle.build_end_point
    @vehicle_data.vehicle_document_photos.build
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
    #@vehicle_data = @vehicle.build_vehicle_data
    #@vehicle_data.vehicle_document_photos.build
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_make, :vehicle_number, :user_id, :start_point_attributes => [:name, :address, :vehicle_id, :latitude, :longitude, :gmaps],
       :end_point_attributes => [:name, :address, :latitude, :longitude, :vehicle_data_id], :vehicle_data_attributes => [:registration_data, :purchase_date_and_year, :owner_name, :owner_address, :vehicle_detail, :vehicle_id, :vehicle_document_photos_attributes => [:name, :photo, :vehicle_data_id]])
    end
end
