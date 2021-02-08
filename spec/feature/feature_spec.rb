# frozen_string_literal: true

require 'time'
require './spec/helpers/transactions_helper'
require './spec/helpers/statement_helper'

describe 'Acceptance Criteria' do
  let(:account) { Account.new }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  it 'should receive two deposits and one withdrawal and return a statement' do
    three_transactions

    expect(account.print_statement).to eq(statement_string)
  end
end
