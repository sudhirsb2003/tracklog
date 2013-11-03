class AttendencesController < ApplicationController

    def new
      @attendence = Attendence.new
      @a = Attendence.where("DATE(created_at) = ? and travel_type = ?", Date.today, "pick up")
    end

   def create
     @vehicle = Vehicle.find(params[:vehicle_id])
     travel_type = params[:travel_type]
     @attendence = Attendence.create( :vehicle_id => @vehicle.id,
                                      :user_id => params[:user_id].to_i,
                                      :pick_up_point_id => 1,
                                      :travel_type => travel_type)
     @attendence.save
     redirect_to new_attendence_path, :notice => "pending"
   end

   def edit
     @attendence = Attendence.find(params[:id])
   end

  def update
    @attendence = Attendence.find(params[:id])
    if @attendence.update(attendence_params)
       @attendence.submit!
      redirect_to new_attendence_path, notice: 'Confirmed.'
    else
      render action: 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendence
      @attendence = Attendence.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendence_params
      params.require(:attendence).permit(:travel_type, :vehicle_id, :pick_up_point_id, :status, :employee_id, :user_id)
    end

end
