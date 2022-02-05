class StatusFetcher
  attr_reader :address
  attr_reader :transactions

  def initialize(address)
    @address = address
    @transactions = EtherscanGateway.new.transactions_for_address(@address)
  end

  def current_balance
    @current_balance ||= transactions.sum { |transaction_hash|
      deposit_value(transaction_hash) - deduction_value(transaction_hash)
    }
  end

  def confirmed_balance
    @confirmed_balance ||= transactions.sum { |transaction_hash|
      next(0) unless confirmed?(transaction_hash)

      deposit_value(transaction_hash) - deduction_value(transaction_hash)
    }
  end

  def total_ether_deposited
    @total_ether_deposited ||= transactions.sum { |transaction_hash|
      deposit_value(transaction_hash)
    }
  end

  def total_ether_deducted
    @total_ether_deducted ||= transactions.sum { |transaction_hash|
      deduction_value(transaction_hash)
    }
  end

  def transaction_count
    @transaction_count ||= transactions.count
  end

  private

  def deposit_value(transaction_hash)
    if transaction_hash["to"] == @address
      Integer(transaction_hash["value"])
    else
      0
    end
  end

  def deduction_value(transaction_hash)
    if transaction_hash["from"] == @address
      Integer(transaction_hash["value"])
    else
      0
    end
  end

  def confirmed?(transaction_hash)
    Integer(transaction_hash["confirmations"]) >= 20
  end

  class Struct
    attr_reader :address
    attr_reader :current_balance
    attr_reader :confirmed_balance
    attr_reader :total_ether_deposited
    attr_reader :total_ether_deducted
    attr_reader :transaction_count

    def initialize(address:,
                   current_balance:, confirmed_balance:,
                   total_ether_deposited:, total_ether_deducted:,
                   transaction_count:,
                   **rest)
      @address               = address
      @current_balance       = current_balance
      @confirmed_balance     = confirmed_balance
      @total_ether_deposited = total_ether_deposited
      @total_ether_deducted  = total_ether_deducted
      @transaction_count     = transaction_count
    end


  end
end
