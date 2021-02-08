# frozen_string_literal: true

# an Account class for recieving deposits, withdrawals and printing statements
class Account
  attr_reader :balance

  def initialize
    @balance = 0.00
    @transaction_log = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_log << { type: :credit, date: Date.today, value: amount, balance: @balance }
  end

  def withdrawal(amount)
    @balance -= amount
    @transaction_log << { type: :debit, date: Date.today, value: amount, balance: @balance }
  end

  def print_statement
    statement = @transaction_log.map do |transaction|
      transaction[:type] == :credit ? credit_statement(transaction) : debit_statement(transaction)
    end

    "date || credit || debit || balance\n#{statement.reverse.join("\n")}"
  end

  private

  def credit_statement(transaction)
    "#{transaction[:date].strftime('%d/%m/%Y')} || "\
    "#{format('%.2f', transaction[:value])} || "\
    '|| '\
    "#{format('%.2f', transaction[:balance])}"
  end

  def debit_statement(transaction)
    "#{transaction[:date].strftime('%d/%m/%Y')} || "\
    '|| '\
    "#{format('%.2f', transaction[:value])} || "\
    "#{format('%.2f', transaction[:balance])}"
  end
end
