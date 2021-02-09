# bank_tech_test
A practice tech test, focusing on code quality.

## Motivation
This is a practice for the type of tests potential employers offer as part of their recruitment process. They are not just looking for a valid solution that meets the requirements and acceptance criteria, but code that is built to a high standard. This means, TDD, OO, and good style, project structure, and version control.

## Design Approach
Kept the project as simple as possible whilst maintaining testing, coverage, style and build status.

Built out the solution with TDD. Started from a simple account object that returned the appropriate string. Expanded this to include the transaction_log, and refactored the statement generation into a separate statement class.

Refactored methods according to SRP and DRY as far as possible.

## Build status

Travis: [![Build Status](https://travis-ci.com/chriswhitehouse/bank_tech_test.svg?branch=main)](https://travis-ci.com/chriswhitehouse/bank_tech_test)

## Code style

Rubocop: [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

## Screenshots

![irb](https://github.com/chriswhitehouse/bank_tech_test/blob/main/screenshots/Screenshot%202021-02-09%20at%2020.00.29.png)

## Tech/framework used
Ruby, with Rspec testing framework.

## Features
### User Stories

```
As a customer,
So that I can add money to my account,
I want to be able to make a deposit
```
```
As a customer,
So that I can take money out of my account,
I want to be able to make a withdrawal
```
```
As a customer,
So that I have a record of my deposits and withdrawals,
I want to be able to print a statement
```

### Acceptance Criteria

**Given** a customer makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
12/01/2012 || 1000.00 || || 1000.00
```

### Domain Model
| Objects     | Methods     |
| :------------- | :------------- |
| Account     | deposit, withdrawal, print_statement       |
| Statement | create_string |
| TransactionLog | add_transaction, show |
| Transaction | date, credit, debit, balance |


## Code Example
```Ruby
class Account
  attr_reader :balance

  def initialize(statement_class = Statement, transaction_log_class = TransactionLog)
    @statement_class = statement_class
    @balance = 0.00
    @transaction_log = transaction_log_class.new
  end

  def deposit(amount)
    raise 'Error: Only positive numeric arguments can be deposited' unless positive_numeric?(amount)

    credit_balance(amount)
    @transaction_log.add_transaction(
      type: :credit, amount: amount, balance: @balance
    )
  end

  def withdrawal(amount)
    raise 'Error: Only positive numeric arguments can be withdrawn' unless positive_numeric?(amount)
    raise 'Error: Insufficient funds available' unless sufficient_balance?(amount)

    debit_balance(amount)
    @transaction_log.add_transaction(
      type: :debit, amount: amount, balance: @balance
    )
  end

  def print_statement
    print @statement_class.new(@transaction_log.show).create_string
  end

  private

  def positive_numeric?(amount)
    amount.is_a?(Numeric) && amount.positive?
  end

  def sufficient_balance?(amount)
    amount <= @balance
  end

  def credit_balance(amount)
    @balance += amount
  end

  def debit_balance(amount)
    @balance -= amount
  end
end
```

## Installation
* Clone the repo.
* `$ bundle install`

## Tests
Test can be run with:
`$ rspec`

12 examples, 0 failures, 100% coverage.

## How to use?
Use in irb:

`$ irb`
`> require './lib/account.rb'`
`> account = Account.new`
`> account.deposit.(1000)`
`> account.withdrawal(500)`
`> account.print_statement`
