class TracksController < ApplicationController
  def create
    Tracker.new.track!(status_params[:address])
    
    render :create

  rescue RuntimeError => e
    render :error, locals: { error: e }, status: 400
  end

  private

  def status_params
    params.require(:status).permit(:address)
  end
end
