require 'account.rb'

describe Account do
  let(:account) { Account.new }

  describe "#deposit" do
    it 'should add money to the account balance' do
      expect(account.deposit(1000)).to eq 1000
    end
  end
end
