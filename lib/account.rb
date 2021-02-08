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
    return "date || credit || debit || balance\n" + @statement.reverse.join("\n")
  end

  private

  def credit_statement(amount)
    @statement << "#{Date.today().strftime("%d/%m/%Y")} || #{sprintf('%.2f', amount)} || || #{sprintf('%.2f', @balance)}"
  end

  def debit_statement(amount)
    @statement << "#{Date.today().strftime("%d/%m/%Y")} || || #{sprintf('%.2f', amount)} || #{sprintf('%.2f', @balance)}"
  end
end
