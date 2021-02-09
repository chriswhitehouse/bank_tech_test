# frozen_string_literal: true

require 'time'
require './spec/helpers/transaction_helper'
require './spec/helpers/statement_helper'

describe 'Acceptance Criteria' do
  let(:account) { Account.new }

  it 'should receive two deposits and one withdrawal and return a statement' do
    three_transactions

    # expect { print('foo') }.to output(/foo/).to_stdout
    expect { account.print_statement }.to output(statement_string).to_stdout
  end
end
