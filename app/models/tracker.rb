class Tracker
  def track!(address)
    raise "the address needs to be present" if address.blank?

    Status.track!(address)
  end
end
