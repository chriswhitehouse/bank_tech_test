# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#new' do
    let(:testdate1) { Date.new(2012, 1, 12) }
    let(:transaction) { Transaction.new(type: :credit, value: 500, balance: 500) }

    it 'should create a new instance of a transaction' do
      allow(Date).to receive(:today).and_return(testdate1)
      expect(transaction).to be_a Transaction
      expect(transaction.date).to eq testdate1
      expect(transaction.credit).to eq 500
      expect(transaction.balance).to eq 500
    end
  end
end
