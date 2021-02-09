# frozen_string_literal: true

require 'transaction_log'

describe TransactionLog do
  let(:transaction_log) { TransactionLog.new }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  describe '#add_transaction' do
    it 'should record all transactions' do
      allow(Date).to receive(:today).and_return(testdate1)
      transaction_log.add_transaction(type: :credit, amount: 1000, balance: 1000)
      allow(Date).to receive(:today).and_return(testdate2)
      transaction_log.add_transaction(type: :credit, amount: 2000, balance: 3000)
      allow(Date).to receive(:today).and_return(testdate3)
      transaction_log.add_transaction(type: :debit, amount: 500, balance: 2500)

      expect(transaction_log.show).to eq [
        { date: testdate1, credit: 1000, debit: '', balance: 1000.0 },
        { date: testdate2, credit: 2000, debit: '', balance: 3000.0 },
        { date: testdate3, credit: '', debit: 500, balance: 2500.0 }
      ]
    end
  end
end
