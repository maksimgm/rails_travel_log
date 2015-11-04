class EntriesController < ApplicationController
	before_action :confirm_logged_in

  # def new
  #   @trip = Trip.find_by_id params[:trip_id]
  # 	@entry = Entry.new
  # end  

  def create
  	@trip = Trip.find_by_id(params[:trip_id])

  	@entry = @trip.entries.build entry_params

  	if @entry.save
  		# flash[:success] = "Entry created"
  		render json: @entry
  	else
  		render json: {errors: @note.errors.full_messages}
  	end
  end

  def edit
  	@entry = Entry.find_by_id(params[:id])
  end

  def update
  	@entry = Entry.find_by_id(params[:id])

  	if @entry.update(entry_params)
  		flash[:updated] = "Entry Updated"
  		redirect_to @entry.trip
  	else
  		render :edit
  	end
  end

  def destroy
  	@entry = Entry.find_by_id(params[:id])
  	if @entry.destroy
      render json: {}
    end
    # where to redirect_to?
    # redirect_to @entry.trip
  end

  private

  def entry_params
		params.require(:entry).permit(:title, :location, :summary, :cost, :image, :video_url)
  end
end
