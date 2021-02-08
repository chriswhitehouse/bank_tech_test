# frozen_string_literal: true

# an Account class for recieving deposits, withdrawals and printing statements
class Account
  attr_reader :balance

  def initialize
    @balance = 0.00
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    credit_statement(amount)
  end

  def withdrawal(amount)
    @balance -= amount
    debit_statement(amount)
  end

  def print_statement
    "date || credit || debit || balance\n#{@statement.reverse.join("\n")}"
  end

  private

  def credit_statement(amount)
    @statement << "#{Date.today.strftime('%d/%m/%Y')} || #{format('%.2f',
                                                                  amount)} || || #{format('%.2f', @balance)}"
  end

  def debit_statement(amount)
    @statement << "#{Date.today.strftime('%d/%m/%Y')} || || #{format('%.2f',
                                                                     amount)} || #{format('%.2f', @balance)}"
  end
end
