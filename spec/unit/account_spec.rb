# frozen_string_literal: true

require 'account'
require 'time'

describe Account do
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  let(:statement_string) do
                          "date || credit || debit || balance\n"\
                          "14/01/2012 || || 500.00 || 2500.00\n"\
                          "13/01/2012 || 2000.00 || || 3000.00\n"\
                          "12/01/2012 || 1000.00 || || 1000.00"
                        end
  let(:statement_double) { double :statement, create_string: statement_string }
  let(:statement_class_double) { double :statement_class, new: statement_double }

  let(:transaction_log_array) do
    [
      { type: :credit, date: testdate1, value: 1000, balance: 1000.0 },
      { type: :credit, date: testdate2, value: 2000, balance: 3000.0 },
      { type: :debit, date: testdate3, value: 500, balance: 2500.0 }
    ]
  end
  let(:transaction_log_double) { double :transaction_log, show: transaction_log_array, add_transaction: true }
  let(:transaction_log_class_double) { double :transaction_log_class, new: transaction_log_double }

  let(:account) { Account.new(statement_class_double, transaction_log_class_double) }

  describe '#deposit' do
    it 'should add money to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end

    it 'should return error if non integer is passed' do
      expect { account.deposit('') }
        .to raise_error('Error: Only positive numeric arguments can be deposited')
    end

    it 'should return error if negative integer is passed' do
      expect { account.deposit(-1) }
        .to raise_error('Error: Only positive numeric arguments can be deposited')
    end
  end

  describe '#withdrawal' do
    it 'should remove money from the account balance' do
      account.deposit(1000)
      expect { account.withdrawal(1000) }.to change { account.balance }.by(-1000)
    end

    it 'should return error if non integer is passed' do
      expect { account.withdrawal('') }
        .to raise_error('Error: Only positive numeric arguments can be withdrawn')
    end

    it 'should return error if negative integer is passed' do
      expect { account.withdrawal(-1) }
        .to raise_error('Error: Only positive numeric arguments can be withdrawn')
    end

    it 'should return error if insufficient funds are available' do
      expect { account.withdrawal(500) }
        .to raise_error('Error: Insufficient funds available')
    end
  end

  describe '#print_statement' do
    it 'should print all transactions with balances' do
      allow(Date).to receive(:today).and_return(testdate1)
      account.deposit(1000)
      allow(Date).to receive(:today).and_return(testdate2)
      account.deposit(2000)
      allow(Date).to receive(:today).and_return(testdate3)
      account.withdrawal(500)
      
      expect { account.print_statement }.to output(statement_string).to_stdout
    end
  end
end
