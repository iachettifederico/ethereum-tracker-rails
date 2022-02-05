class StatusController < ApplicationController
  def show
    status = Status.for(params[:address])

    render :show, locals: { status: status }

  rescue RuntimeError => e
    render :error, locals: { error: e }, status: 400
  end
end
