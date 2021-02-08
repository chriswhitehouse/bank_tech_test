# frozen_string_literal: true

module Helpers
  module Transaction
    def testdate1
      Date.new(2012, 1, 12)
    end

    def testdate2
      Date.new(2012, 1, 13)
    end

    def testdate3
      Date.new(2012, 1, 14)
    end

    def one_transaction
      allow(Date).to receive(:today).and_return(testdate1)
      account.deposit(1000)
    end

    def two_transactions
      one_transaction
      allow(Date).to receive(:today).and_return(testdate2)
      account.deposit(2000)
    end

    def three_transactions
      two_transactions
      allow(Date).to receive(:today).and_return(testdate3)
      account.withdrawal(500)
    end

    def transaction_log_array
      [
        { type: :credit, date: testdate1, value: 1000, balance: 1000.0 },
        { type: :credit, date: testdate2, value: 2000, balance: 3000.0 },
        { type: :debit, date: testdate3, value: 500, balance: 2500.0 }
      ]
    end

    def transaction_log_double
      transaction_log_double = double('transaction_log')
      allow(transaction_log_double).to receive(:show).and_return(transaction_log_array)
      allow(transaction_log_double).to receive(:add_transaction).with(anything).and_return(true)

      transaction_log_double
    end

    def transaction_log_class_double
      transaction_log_class_double = double('transaction_log_class')
      allow(transaction_log_class_double).to receive(:new).and_return(transaction_log_double)

      transaction_log_class_double
    end
  end
end
