# encoding: utf-8

class TrackpointsController < ApplicationController

  def create

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_start_point
      @start_point = StartPoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def passenger_params
      params.require(:start_point).permit(:vehicle_id, :latitude, :longitude, :gmaps, :address, :name)
    end

end
