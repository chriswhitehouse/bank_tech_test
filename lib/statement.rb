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

    return STATEMENT_HEADER + statement.reverse.join("\n").to_s
  end

  private

  def stringify(transaction)
    "#{date_format(transaction[:date])} || " +
      if transaction[:type] == :credit
        "#{value_format(transaction[:value])} || || "
      else
        "|| #{value_format(transaction[:value])} || "
      end +
      value_format(transaction[:balance]).to_s
  end

  def date_format(date)
    date.strftime('%d/%m/%Y')
  end

  def value_format(value)
    format('%.2f', value)
  end
end
