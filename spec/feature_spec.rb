require 'time'

describe "Acceptance Criteria" do
  let(:account) { Account.new }
  let(:first_date) { Date.new(2012, 01, 12) }
  let(:second_date) { Date.new(2012, 01, 13) }
  let(:third_date) { Date.new(2012, 01, 14) }

  it "should receive a 2 deposits and one withdrawal and return a statement" do
    allow(Date).to receive(:today).and_return(first_date)
    account.deposit(1000)
    allow(Date).to receive(:today).and_return(second_date)
    account.deposit(2000)
    allow(Date).to receive(:today).and_return(third_date)
    account.withdrawal(500)
    expect(account.print_statement).to eq "date || credit || debit || balance\n
    14/01/2012 || || 500.00 || 2500.00\n
    13/01/2012 || 2000.00 || 3000.00\n
    12/01/2012 || 1000.00 || 1000.00"
  end
end
