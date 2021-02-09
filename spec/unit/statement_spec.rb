# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  let(:transaction1_double) { double :transaction1, date: testdate1, credit: 1000, debit: '', balance: 1000 }
  let(:transaction2_double) { double :transaction2, date: testdate2, credit: 2000, debit: '', balance: 3000 }
  let(:transaction3_double) { double :transaction3, date: testdate3, credit: '', debit: 500, balance: 2500 }

  let(:transaction_log_array) do
    [
      transaction1_double,
      transaction2_double,
      transaction3_double
    ]
  end

  let(:statement_string) do
    "date || credit || debit || balance\n"\
    "14/01/2012 || || 500.00 || 2500.00\n"\
    "13/01/2012 || 2000.00 || || 3000.00\n"\
    '12/01/2012 || 1000.00 || || 1000.00'
  end

  let(:statement) { Statement.new(transaction_log_array) }

  describe '#string' do
    it 'should return a statement string to be printed' do
      expect(statement.create_string).to eq(statement_string)
    end
  end
end
