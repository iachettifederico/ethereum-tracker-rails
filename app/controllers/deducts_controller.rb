class DeductsController < ApplicationController
  def create
    EtherscanGateway.new.deduct!(
      params["address"],
      amount:    Integer(params["amount"]),
      confirmed: params["confirmed"] == "on"
    )

    redirect_to root_path
  end
end
