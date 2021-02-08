class Account
  attr_reader :balance

  def initialize
    @balance = 0.00
    @statement = []
  end

  def deposit(amount)
    @statement << "#{Date.today().strftime("%d/%m/%Y")} || #{sprintf('%.2f', amount)} || || #{sprintf('%.2f', @balance += amount)}"
  end

  def withdrawal(amount)
    @statement << "#{Date.today().strftime("%d/%m/%Y")} || || #{sprintf('%.2f', amount)} || #{sprintf('%.2f', @balance -= amount)}"
  end

  def print_statement

    return "date || credit || debit || balance\n" + @statement.reverse.join("\n")



    # if @balance == 1000
    #   "date || credit || debit || balance\n12/01/2012 || 1000.00 || || 1000.00"
    # elsif @balance == 3000
    #   "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n12/01/2012 || 1000.00 || || 1000.00"
    # else
    #   "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n12/01/2012 || 1000.00 || || 1000.00"
    # end
  end
end
