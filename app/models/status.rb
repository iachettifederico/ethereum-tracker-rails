class Status < ApplicationRecord
  def self.for(address)
    status = find_by(address: address)

    raise "the address is not being tracked" if status.blank?

    status
  end

  def self.track!(address)
    status = fetch_status_for!(address)
    create!(
      address:               status.address,
      current_balance:       status.current_balance,
      confirmed_balance:     status.confirmed_balance,
      total_ether_deposited: status.total_ether_deposited,
      total_ether_deducted:  status.total_ether_deducted,
      transaction_count:     status.transaction_count
    )
  end

  private

  def self.fetch_status_for!(address)
    StatusFetcher.new(address)
  end
end
