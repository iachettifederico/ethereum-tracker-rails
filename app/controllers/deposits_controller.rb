class DepositsController < ApplicationController
  def create
    EtherscanGateway.new.deposit!(
      deposit_params["address"],
      amount:    Integer(deposit_params["amount"]),
      confirmed: deposit_params["confirmed"] == "on"
    )

    redirect_to root_path
  end

  private

  def deposit_params
    params.require(:deposit).permit(:address, :amount, :confirmed)
  end
end
