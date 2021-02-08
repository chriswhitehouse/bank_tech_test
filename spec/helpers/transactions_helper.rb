# frozen_string_literal: true

module Helpers
  module Transactions
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
