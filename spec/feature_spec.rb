# frozen_string_literal: true

require 'time'
require './spec/helpers/transactions_helper'

describe 'Acceptance Criteria' do
  let(:account) { Account.new }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  it 'should receive a 2 deposits and one withdrawal and return a statement' do
    three_transactions

    expect(account.print_statement).to eq(
      "date || credit || debit || balance\n"\
      "14/01/2012 || || 500.00 || 2500.00\n"\
      "13/01/2012 || 2000.00 || || 3000.00\n"\
      '12/01/2012 || 1000.00 || || 1000.00'
    )
  end
end
