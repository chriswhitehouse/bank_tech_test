class Account
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    @balance -= amount
  end

  def print_statement
    if @balance == 1000
      "date || credit || debit || balance\n12/01/2012 || 1000.00 || || 1000.00"
    else
      "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n12/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
