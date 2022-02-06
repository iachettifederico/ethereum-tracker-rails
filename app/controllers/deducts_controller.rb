class DeductsController < ApplicationController
  def create
    EtherscanGateway.new.deduct!(
      deduct_params["address"],
      amount:    Integer(deduct_params["amount"]),
      confirmed: deduct_params["confirmed"] == "on"
    )

    redirect_to root_path
  end

  private

  def deduct_params
    params.require(:deduct).permit(:address, :amount, :confirmed)
  end
end
