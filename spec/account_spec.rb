require 'account.rb'
require 'time'

describe Account do
  let(:account) { Account.new }
  let(:test_date_1) { Date.new(2012,01,12) }
  let(:test_date_2) { Date.new(2012,01,13) }

  describe "#deposit" do
    it 'should add money to the account balance' do
      expect(account.deposit(1000)).to eq 1000
    end
  end

  describe "#withdrawal" do
    it 'should remove money from the account balance' do
      expect(account.withdrawal(1000)).to eq -1000
    end
  end

  describe "#print_statement" do
    it 'should print one transaction and the account balance' do
      allow(Date).to receive(:today).and_return(test_date_1)
      account.deposit(1000)
      expect(account.print_statement).to eq "date || credit || debit || balance\n12/01/2012 || 1000.00 || || 1000.00"
    end

    it 'should print two transactions and the account balance for each' do
      allow(Date).to receive(:today).and_return(test_date_2)
      account.deposit(2000)
      expect(account.print_statement).to eq "date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n12/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
