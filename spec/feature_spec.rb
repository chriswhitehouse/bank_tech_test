require 'time'

describe "Acceptance Criteria" do
  let(:account) { Account.new }
  let(:test_date_1) { Date.new(2012, 01, 12) }
  let(:test_date_2) { Date.new(2012, 01, 13) }
  let(:test_date_3) { Date.new(2012, 01, 14) }

  it "should receive a 2 deposits and one withdrawal and return a statement" do
    allow(Date).to receive(:today).and_return(test_date_1)
    account.deposit(1000)
    allow(Date).to receive(:today).and_return(test_date_2)
    account.deposit(2000)
    allow(Date).to receive(:today).and_return(test_date_3)
    account.withdrawal(500)
    expect(account.print_statement).to eq "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n12/01/2012 || 1000.00 || || 1000.00"
  end
end
