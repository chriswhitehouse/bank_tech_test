# frozen_string_literal: true

require 'time'
require './spec/helpers/transactions_helper'
require './spec/helpers/statement_helper'

describe 'Acceptance Criteria' do
  let(:account) { Account.new }

  it 'should receive two deposits and one withdrawal and return a statement' do
    three_transactions

    expect(account.print_statement).to eq(statement_string)
  end
end
