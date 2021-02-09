# frozen_string_literal: true

require 'time'

# A TransactionLog class for recording all transactions a returning a duplicate array
class TransactionLog
  def initialize
    @transaction_log = []
  end

  def add_transaction(type:, amount:, balance:)
    @transaction_log << create_transacton_hash(type: type, value: amount, balance: balance)
  end

  def show
    @transaction_log.dup
  end

  def create_transacton_hash(type:, value:, balance:)
    if type == :credit
      { date: Date.today, credit: value, debit: '' , balance: balance }
    else
      { date: Date.today, credit: '', debit: value , balance: balance }
    end
  end
end
