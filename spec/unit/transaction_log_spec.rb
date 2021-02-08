# frozen_string_literal: true

require 'transaction_log'

describe TransactionLog do
  let(:transaction_log) { TransactionLog.new }
  describe '#add_transaction' do
    it 'should record all transactions' do
      allow(Date).to receive(:today).and_return(testdate1)
      transaction_log.add_transaction(type: :credit, amount: 1000, balance: 1000)
      allow(Date).to receive(:today).and_return(testdate2)
      transaction_log.add_transaction(type: :credit, amount: 2000, balance: 3000)
      allow(Date).to receive(:today).and_return(testdate3)
      transaction_log.add_transaction(type: :debit, amount: 500, balance: 2500)
      expect(transaction_log.show).to eq [
        { type: :credit, date: testdate1, value: 1000, balance: 1000.0 },
        { type: :credit, date: testdate2, value: 2000, balance: 3000.0 },
        { type: :debit, date: testdate3, value: 500, balance: 2500.0 }
      ]
    end
  end
end
