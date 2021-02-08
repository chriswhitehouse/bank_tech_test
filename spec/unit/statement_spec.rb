require 'statement'

describe Statement do
  let(:testdate1) { Date.new(2012, 1, 12) }
  let(:testdate2) { Date.new(2012, 1, 13) }
  let(:testdate3) { Date.new(2012, 1, 14) }
  let(:transaction_log) {[
      {:type=>:credit, :date=>testdate1, :value=>1000, :balance=>1000.0},
      {:type=>:credit, :date=>testdate2, :value=>2000, :balance=>3000.0},
      {:type=>:debit, :date=>testdate3, :value=>500, :balance=>2500.0}]
  }

  let(:statement) { Statement.new(transaction_log) }

  describe '#string' do
    it 'should return a statement string to be printed' do
      expect(statement.string).to eq(
                                        "date || credit || debit || balance\n"\
                                        "14/01/2012 || || 500.00 || 2500.00\n"\
                                        "13/01/2012 || 2000.00 || || 3000.00\n"\
                                        "12/01/2012 || 1000.00 || || 1000.00"
                                      )
    end
  end
end
