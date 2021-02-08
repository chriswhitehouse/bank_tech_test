# frozen_string_literal: true

require 'account'
require 'time'
require './spec/helpers/transactions_helper'

describe Account do
  let(:account) { Account.new }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  describe '#deposit' do
    it 'should add money to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end
  end

  describe '#withdrawal' do
    it 'should remove money from the account balance' do
      expect { account.withdrawal(1000) }.to change { account.balance }.by(-1000)
    end
  end

  describe '#print_statement' do
    it 'should print three transactions and the account balance for each' do
      three_transactions
      expect(account.print_statement).to eq(
        "date || credit || debit || balance\n"\
        "14/01/2012 || || 500.00 || 2500.00\n"\
        "13/01/2012 || 2000.00 || || 3000.00\n"\
        '12/01/2012 || 1000.00 || || 1000.00'
      )
    end
  end
end
