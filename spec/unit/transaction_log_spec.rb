# frozen_string_literal: true

require 'transaction_log'

describe TransactionLog do
  let(:transaction_class_double) { double :transaction_class }
  let(:transaction_log) { TransactionLog.new(transaction_class_double) }
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }

  let(:transaction1_double) { double :transaction1, date: testdate1, credit: 1000, debit: '', balance: 1000 }
  let(:transaction2_double) { double :transaction2, date: testdate2, credit: 2000, debit: '', balance: 3000 }
  let(:transaction3_double) { double :transaction3, date: testdate3, credit: '', debit: 500, balance: 2500 }

  let(:transaction_log_array) { [transaction1_double, transaction2_double, transaction3_double] }

  describe '#add_transaction' do
    it 'should record all transactions' do
      allow(transaction_class_double).to receive(:new).and_return(transaction1_double)
      transaction_log.add_transaction(type: :credit, amount: 1000, balance: 1000)
      allow(transaction_class_double).to receive(:new).and_return(transaction2_double)
      transaction_log.add_transaction(type: :credit, amount: 2000, balance: 3000)
      allow(transaction_class_double).to receive(:new).and_return(transaction3_double)
      transaction_log.add_transaction(type: :debit, amount: 500, balance: 2500)

      expect(transaction_log.show).to eq transaction_log_array
    end
  end
end
