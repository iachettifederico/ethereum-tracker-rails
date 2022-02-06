class HomeController < ApplicationController
  def show
    render :show, locals: { addresses: Status.tracked_addresses }
  end
end
