# frozen_string_literal: true

require './lib/statement'
require './lib/transaction_log'
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
    raise 'Error: Only positive numeric arguments can be deposited' unless numeric?(amount) && amount.positive?

    credit_balance(amount)
    @transaction_log.add_transaction(
      type: :credit, amount: amount, balance: @balance
    )
  end

  def withdrawal(amount)
    raise 'Error: Only positive numeric arguments can be withdrawn' unless numeric?(amount) && amount.positive?

    debit_balance(amount)
    @transaction_log.add_transaction(
      type: :debit, amount: amount, balance: @balance
    )
  end

  def print_statement
    print @statement_class.new(@transaction_log.show).create_string
  end

  private

  def numeric?(amount)
    amount.is_a?(Numeric)
  end

  def credit_balance(amount)
    @balance += amount
  end

  def debit_balance(amount)
    @balance -= amount
  end
end
