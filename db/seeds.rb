addresses = %w[
  0xFF17AaDbF8aa2EBaE7C236081B0C3C04b2a4a11b
  0xFe81e74b3a523aBE7719ca37E819bb39f5Bb600F
  0xb0844690859786465AE92729Dd0750b9d2E2CeD9
  0x5DAafe54985F5C1c421761590Ad1a6064Fb3C998
  0xad83592D04d878897842eFc8421602fb90552713
]

addresses.each do |address|
  puts "Tracking address " + address.yellow
  Tracker.new.track!(address)
end

gateway = EtherscanGateway.new

puts "Adding transactions to " + addresses[0].yellow
gateway.deposit!(addresses[0], amount: 5000, confirmed: true)
gateway.deposit!(addresses[0], amount: 4000, confirmed: false)
gateway.deduct!(addresses[0],  amount: 3000, confirmed: true)
gateway.deduct!(addresses[0],  amount: 2000, confirmed: false)

puts "Adding transactions to " + addresses[1].yellow
gateway.deposit!(addresses[1], amount: 1000, confirmed: true)
gateway.deposit!(addresses[1], amount: 100, confirmed: false)
gateway.deduct!(addresses[1],  amount: 500, confirmed: true)
gateway.deduct!(addresses[1],  amount: 200, confirmed: false)

puts "Adding transactions to " + addresses[2].yellow
gateway.deposit!(addresses[2], amount: 5000, confirmed: true)
gateway.deposit!(addresses[2], amount: 3000, confirmed: false)
gateway.deduct!(addresses[2],  amount: 1000, confirmed: true)
gateway.deduct!(addresses[2],  amount: 2000, confirmed: false)

puts "Adding transactions to " + addresses[3].yellow
gateway.deposit!(addresses[3], amount: 6789, confirmed: true)
gateway.deposit!(addresses[3], amount: 3456, confirmed: false)
gateway.deduct!(addresses[3],  amount: 1234, confirmed: true)
gateway.deduct!(addresses[3],  amount: 1212, confirmed: false)

puts "Adding transactions to " + addresses[4].yellow
gateway.deposit!(addresses[4], amount: 10000, confirmed: true)
gateway.deposit!(addresses[4], amount: 4000, confirmed: false)
gateway.deduct!(addresses[4],  amount: 8000, confirmed: true)
gateway.deduct!(addresses[4],  amount: 1000, confirmed: false)
