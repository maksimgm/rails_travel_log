class TripsController < ApplicationController

def index
  @user = User.find_by_id params[:id]
  @user_trips = @user.trips
end


def new
  @user = User.find_by_id params[:id]
  @trip = Trip.new
end

def create
  @user = User.find_by_id params[:id]
  @trip = @user.trips.build trip_params
  if @trip.save
    flash[:success] = "Trip created successfully"
    redirect_to @trip
  else
    render :new
  end
end

private
def trip_params
  params.require(:trip).permit(:title, :location,:duration,:summary,:budget,:video_url)
end

end
