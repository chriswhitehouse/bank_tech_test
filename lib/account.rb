# frozen_string_literal: true

# An Account class for recieving deposits, withdrawals and printing statements
class Account
  attr_reader :balance

  def initialize(statement_class = Statement)
    @statement_class = statement_class
    @balance = 0.00
    @transaction_log = []
  end

  def deposit(amount)
    raise "Error: Only numeric arguments can be deposited" unless amount.is_a?(Numeric)
    @balance += amount
    @transaction_log << { type: :credit, date: Date.today, value: amount, balance: @balance }
  end

  def withdrawal(amount)
    raise "Error: Only numeric arguments can be withdrawn" unless amount.is_a?(Numeric)
    @balance -= amount
    @transaction_log << { type: :debit, date: Date.today, value: amount, balance: @balance }
  end

  def print_statement
    @statement_class.new(@transaction_log).string
  end
end
