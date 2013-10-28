class AttendencesController < ApplicationController

  def new
    @attendence = Attendence.new
  end

   def create
     @attendence = Attendence.create(:travel_type => params[attendence_params])
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
