class DepositsController < ApplicationController
  def create
    EtherscanGateway.new.deposit!(
      params["address"],
      amount:    Integer(params["amount"]),
      confirmed: params["confirmed"] == "on"
    )

    redirect_to root_path
  end
end
