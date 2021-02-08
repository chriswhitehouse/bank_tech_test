# frozen_string_literal: true

module Helpers
  module Statement
    def statement_string
      "date || credit || debit || balance\n"\
      "14/01/2012 || || 500.00 || 2500.00\n"\
      "13/01/2012 || 2000.00 || || 3000.00\n"\
      '12/01/2012 || 1000.00 || || 1000.00'
    end

    def statement_double
      statement_double = double('statement')
      allow(statement_double).to receive(:string).and_return(statement_string)

      statement_double
    end

    def statement_class_double
      statement_class_double = double('statement_class')
      allow(statement_class_double)
        .to receive(:new)
        .with(anything)
        .and_return(statement_double)

      statement_class_double
    end
  end
end
