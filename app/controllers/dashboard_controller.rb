class DashboardController < ApplicationController
  before_filter :authenticate

  def index
   @attendence = Attendence.new
  end

  def activity_plots_data
    @last_12_months_activity = {}
    this_month = Time.now.beginning_of_month

    0.upto(11) do |i|
      @last_12_months_activity[this_month - i.months] = {
        :distance => 0.0,
        :duration => 0.0,
      }
    end

    @tracks = current_user.tracks.where("start_time >= ?", this_month - 11.months)

    @tracks.each do |track|
      time = Time.mktime(track.start_time.year, track.start_time.month)
      @last_12_months_activity[time][:distance] += track.distance
      @last_12_months_activity[time][:duration] += track.duration
    end

    respond_to do |format|
      format.json do
        render :json => @last_12_months_activity \
          .to_a
          .sort { |a, b| b[0] <=> a[0] }
          .map { |d, a|
            {
              :month => d.strftime("%b"),
              :distance => a[:distance],
              :duration => a[:duration]
            }
          }
      end
    end
  end
end
