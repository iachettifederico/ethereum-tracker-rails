class UpdatesController < ApplicationController
  def create
    Tracker.new.update!

    redirect_to root_path
  end
end
