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

  let(:statement_string) do
                          "date || credit || debit || balance\n"\
                          "14/01/2012 || || 500.00 || 2500.00\n"\
                          "13/01/2012 || 2000.00 || || 3000.00\n"\
                          "12/01/2012 || 1000.00 || || 1000.00"
                        end

  let(:statement) { Statement.new(transaction_log) }

  describe '#string' do
    it 'should return a statement string to be printed' do
      expect(statement.create_string).to eq(statement_string)
    end
  end
end
