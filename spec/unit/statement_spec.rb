# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  let(:transaction_log_array) do
    [
      { date: testdate1, credit: 1000, debit: '', balance: 1000.0 },
      { date: testdate2, credit: 2000, debit: '', balance: 3000.0 },
      { date: testdate3, credit: '', debit: 500, balance: 2500.0 }
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
