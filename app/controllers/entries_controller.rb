class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
  end

  def new
  	@entry = Entry.new
  end

  def edit
  	@entry = Entry.find(params(:id))
  end

  def update
  	@entry = Entry.find(params(:id))
  end

  def destroy
  	@entry = Entry.find(params(:id))
  	@entry.destroy

  	# where to redirect_to?
  	# redirect_to user_trip_entries_path
  end
end
