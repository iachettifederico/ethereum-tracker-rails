class EtherscanGateway
  TRANSACTIONS = Hash.new {|h,k| h[k] = Array.new }

  def initialize
    @index        = 0
  end

  def transactions_for_address(address)
    TRANSACTIONS[address]
  end

  def deposit!(address, amount:, confirmed: true)
    create_transaction!(address,
                        "to"            => address,
                        "value"         => amount.to_i.to_s,
                        "confirmations" => confirmations_for(confirmed),
                       )
  end

  def deduct!(address, amount:, confirmed: true)
    create_transaction!(address,
                        "from"          => address,
                        "value"         => amount.to_i.to_s,
                        "confirmations" => confirmations_for(confirmed),
                       )
  end

  private

  def increment_index!
    @index += 1
  end

  def timestamp
    (Time.new(2021, 1, 1) + @index).strftime("%Y%m%d")
  end

  def confirmations_for(confirmed)
    confirmed ? 100 : 1
  end

  def create_transaction!(address, transaction_hash)
    increment_index!

    new_transaction_hash = {
      "from"             => "0x1111111111111111111111111111111111111111",
      "to"               => "0x1111111111111111111111111111111111111111",
      "blockNumber"      => @index.to_s,
      "timeStamp"        => timestamp,
      "transactionIndex" => @index.to_s,
    }.merge(transaction_hash)

    TRANSACTIONS[address] = TRANSACTIONS[address] + [new_transaction_hash]
  end
end
