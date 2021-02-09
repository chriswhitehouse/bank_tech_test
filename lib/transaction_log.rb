# frozen_string_literal: true

require 'time'

# A TransactionLog class for recording all transactions a returning a duplicate array
class TransactionLog
  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def add_transaction(type:, amount:, balance:)
    @transaction_log << @transaction_class.new(type: type, value: amount, balance: balance)
  end

  def show
    @transaction_log.dup
  end
end
