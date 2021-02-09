# frozen_string_literal: true

require 'account'
require 'time'

describe Account do
  let(:account) { Account.new(statement_class_double, transaction_log_class_double) }

  describe '#deposit' do
    it 'should add money to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end

    it 'should return error if non integer is passed' do
      expect { account.deposit('') }
        .to raise_error('Error: Only numeric arguments can be deposited')
    end
  end

  describe '#withdrawal' do
    it 'should remove money from the account balance' do
      expect { account.withdrawal(1000) }.to change { account.balance }.by(-1000)
    end

    it 'should return error if non integer is passed' do
      expect { account.withdrawal('') }
        .to raise_error('Error: Only numeric arguments can be withdrawn')
    end
  end

  describe '#print_statement' do
    it 'should print all transactions with balances' do
      three_transactions
      expect { account.print_statement }.to output(statement_string).to_stdout
    end
  end
end
