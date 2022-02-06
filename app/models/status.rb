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

  def self.tracked_addresses
    all.pluck(:address)
  end

  def self.update_tracked_addresses!
    tracked_addresses.each do |address|
      update_address!(address)
    end
  end

  def self.update_address!(address)
    updated_status = fetch_status_for!(address)

    find_by(address: address).update(
      current_balance:       updated_status.current_balance,
      confirmed_balance:     updated_status.confirmed_balance,
      total_ether_deposited: updated_status.total_ether_deposited,
      total_ether_deducted:  updated_status.total_ether_deducted,
      transaction_count:     updated_status.transaction_count
    )
  end

  private

  def self.fetch_status_for!(address)
    StatusFetcher.new(address)
  end
end
