class Tracker
  def track!(address)
    assert_address_present!(address)
    assert_address_valid!(address)

    Status.track!(address)
  end

  private

  def assert_address_present!(address)
    raise "the address needs to be present" if address.blank?
  end

  def assert_address_valid!(address)
    # https://rubular.com/r/mYS9lEMIWogLnN
    raise "the address is invalid" unless /\A0x[\da-f]{40}\Z/i === address
  end

end
