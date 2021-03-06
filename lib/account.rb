# frozen_string_literal: true

require './lib/statement'
require './lib/transaction_log'
require './lib/transaction'
require 'time'
# An Account class for recieving deposits, withdrawals and printing statements
class Account
  attr_reader :balance

  def initialize(statement_class = Statement, transaction_log_class = TransactionLog)
    @statement_class = statement_class
    @balance = 0.00
    @transaction_log = transaction_log_class.new
  end

  def deposit(amount)
    raise 'Error: Only positive numeric arguments can be deposited' unless positive_numeric?(amount)

    credit_balance(amount)
    @transaction_log.add_transaction(
      type: :credit, amount: amount, balance: @balance
    )
  end

  def withdrawal(amount)
    raise 'Error: Only positive numeric arguments can be withdrawn' unless positive_numeric?(amount)
    raise 'Error: Insufficient funds available' unless sufficient_balance?(amount)

    debit_balance(amount)
    @transaction_log.add_transaction(
      type: :debit, amount: amount, balance: @balance
    )
  end

  def print_statement
    print @statement_class.new.create_string(@transaction_log.show)
  end

  private

  def positive_numeric?(amount)
    amount.is_a?(Numeric) && amount.positive?
  end

  def sufficient_balance?(amount)
    amount <= @balance
  end

  def credit_balance(amount)
    @balance += amount
  end

  def debit_balance(amount)
    @balance -= amount
  end
end
