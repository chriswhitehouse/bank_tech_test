# frozen_string_literal: true

require 'time'

# A class to record rach transaction
class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(type:, value:, balance:)
    @date = Date.today

    if type == :credit
      @credit = value
      @debit = ''
    else
      @credit = ''
      @debit = value
    end

    @balance = balance
  end
end
