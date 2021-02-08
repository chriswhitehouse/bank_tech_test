# frozen_string_literal: true

module Helpers
  module Transactions
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
  end
end
