# frozen_string_literal: true

require 'account'
require 'time'
require './spec/helpers/transactions_helper'
require './spec/helpers/statement_helper'

describe Account do
  let(:statement_double) { double :statement, string: statement_string }
  let(:statement_class_double) { double :statement_class, new: statement_double }
  let(:account) { Account.new(statement_class_double) }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  describe '#deposit' do
    it 'should add money to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end

    it 'should return error if non integer is passed' do
      expect { account.deposit('') }.to raise_error("Error: Only numeric arguments can be deposited")
    end
  end

  describe '#withdrawal' do
    it 'should remove money from the account balance' do
      expect { account.withdrawal(1000) }.to change { account.balance }.by(-1000)
    end
  end

  describe '#print_statement' do
    it 'should print all transactions with balances' do
      three_transactions
      expect(account.print_statement).to eq(statement_string)
    end
  end
end
