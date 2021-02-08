require 'account.rb'
require 'time'

describe Account do
  let(:account) { Account.new }
  let(:test_date) { Date.new(2012,01,12) }

  describe "#deposit" do
    it 'should add money to the account balance' do
      expect(account.deposit(1000)).to eq 1000
    end
  end

  describe "#withdrawal" do
    it 'should remove money from the account balance' do
      expect(account.withdrawal(1000)).to eq 1000
    end
  end

  describe "#print_statement" do
    it 'should print a list of transactions and the account balance' do
      allow(Date).to receive(:today).and_return(test_date)
      expect(account.print_statement).to eq "date || credit || debit || balance\n
      12/01/2012 || 1000.00 || || 1000.00"
    end
  end
end
