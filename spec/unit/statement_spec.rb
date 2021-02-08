# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction_log) do
    [
      { type: :credit, date: testdate1, value: 1000, balance: 1000.0 },
      { type: :credit, date: testdate2, value: 2000, balance: 3000.0 },
      { type: :debit, date: testdate3, value: 500, balance: 2500.0 }
    ]
  end

  let(:statement) { Statement.new(transaction_log) }

  describe '#string' do
    it 'should return a statement string to be printed' do
      expect(statement.string).to eq(statement_string)
    end
  end
end
