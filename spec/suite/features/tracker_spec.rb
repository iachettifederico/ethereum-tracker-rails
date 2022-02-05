require "rails_helper"

RSpec.describe "Tracking", type: :feature do
  let(:valid_address) { "0xde0B295669a9FD93d5F28D9Ec85E40f4cb697BAe" }
  let(:gateway) { EtherscanGateway.new }

  describe "Track" do
    it "returns an error when tracking an empty string" do
      page.driver.post("/track", { status: { address: "" } })

      expected = {
        "status"  => "ERR",
        "message" => "the address needs to be present",
      }
      expect(JSON.parse(page.body)).to eql(expected)
      expect(page.driver.status_code).to eql(400)
    end

    it "tracks an address" do
      page.driver.post("/track", { status: { address: valid_address } })

      expected = {
        "status" => "OK",
      }
      expect(JSON.parse(page.body)).to eql(expected)
      expect(page.driver.status_code).to eql(200)
    end
  end

  describe "status" do
    it "returns an error when fetching a non-existent address" do
      page.driver.get("/status/i-do-not-exist")

      expected = {
        "status"  => "ERR",
        "message" => "the address is not being tracked",
      }
      expect(JSON.parse(page.body)).to eql(expected)
      expect(page.driver.status_code).to eql(400)
    end

    it "gets the status of an address" do
      gateway.deposit!(valid_address, amount: 5, confirmed: true)
      gateway.deposit!(valid_address, amount: 4, confirmed: false)
      gateway.deduct!(valid_address,  amount: 3, confirmed: true)
      gateway.deduct!(valid_address,  amount: 2, confirmed: false)

      page.driver.post("/track", { status: { address: valid_address } })
      page.driver.get("/status/#{valid_address}")

      expected = {
        "status"   => "OK",
        "response" => {
          "current_balance"       => 4,
          "confirmed_balance"     => 2,
          "total_ether_deposited" => 9,
          "total_ether_deducted"  => 5,
        }
      }
      expect(JSON.parse(page.body)).to eql(expected)
      expect(page.driver.status_code).to eql(200)
    end
  end
end
