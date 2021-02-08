# frozen_string_literal: true

module Helpers
  module Statement
    def statement_string
      "date || credit || debit || balance\n"\
      "14/01/2012 || || 500.00 || 2500.00\n"\
      "13/01/2012 || 2000.00 || || 3000.00\n"\
      '12/01/2012 || 1000.00 || || 1000.00'
    end
  end
end
