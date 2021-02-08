# frozen_string_literal: true
require './lib/statement.rb'
require 'time'
# An Account class for recieving deposits, withdrawals and printing statements
class Account
  attr_reader :balance

  def initialize(statement_class = Statement)
    @statement_class = statement_class
    @balance = 0.00
    @transaction_log = []
  end

  def deposit(amount)
    raise "Error: Only numeric arguments can be deposited" unless is_numeric?(amount)
    credit_balance(amount)
    add_transaction(type: :credit, amount: amount)
  end

  def withdrawal(amount)
    raise "Error: Only numeric arguments can be withdrawn" unless is_numeric?(amount)
    debit_balance(amount)
    add_transaction(type: :debit, amount: amount)
  end

  def print_statement
    @statement_class.new(@transaction_log).string
  end

  private

    def is_numeric?(amount)
      amount.is_a?(Numeric)
    end

    def credit_balance(amount)
      @balance += amount
    end

    def debit_balance(amount)
      @balance -= amount
    end

    def add_transaction(type:, amount:)
      @transaction_log << { type: type, date: Date.today, value: amount, balance: @balance }
    end
end
