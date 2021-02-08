# frozen_string_literal: true

# A statement class for generating the statement to be printed by the Account class
class Statement
  attr_reader :string

  def initialize(transaction_log)
    statement = transaction_log.map do |transaction|
      transaction[:type] == :credit ? credit_statement(transaction) : debit_statement(transaction)
    end

    @string = "date || credit || debit || balance\n#{statement.reverse.join("\n")}"
  end

  private

  def credit_statement(transaction)
    "#{transaction[:date].strftime('%d/%m/%Y')} || "\
    "#{format('%.2f', transaction[:value])} || "\
    '|| '\
    "#{format('%.2f', transaction[:balance])}"
  end

  def debit_statement(transaction)
    "#{transaction[:date].strftime('%d/%m/%Y')} || "\
    '|| '\
    "#{format('%.2f', transaction[:value])} || "\
    "#{format('%.2f', transaction[:balance])}"
  end
end
