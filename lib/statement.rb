# frozen_string_literal: true

# A statement class for generating the statement to be printed by the Account
# class
class Statement
  attr_reader :string

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize(transaction_log)
    @transaction_log = transaction_log
  end

  def create_string
    statement = @transaction_log.map do |transaction|
      stringify(transaction)
    end

    STATEMENT_HEADER + statement.reverse.join("\n").to_s
  end

  private

  def stringify(transaction)
    [date_format(transaction.date),
     value_format(transaction.credit),
     value_format(transaction.debit),
     value_format(transaction.balance)
   ].join(' ||')
  end

  def date_format(date)
    date.strftime('%d/%m/%Y')
  end

  def value_format(value)
    value.is_a?(Numeric) ? ' ' + format('%.2f', value) : value
  end
end
