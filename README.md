# bank_tech_test
A practice tech test, focusing on code quality.

## Motivation
This is a practice for the type of tests potential employers offer as part of their recruitment process. They are not just looking for a valid solution that meets the requirements and acceptance criteria, but code that has built to a high standard. This means, TDD, OO, and good style, project structure, and good version control.

## Build status

Travis: [![Build Status](https://travis-ci.com/chriswhitehouse/bank_tech_test.svg?branch=main)](https://travis-ci.com/chriswhitehouse/bank_tech_test)

## Code style

Ruby Standard Style: [![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## Screenshots
Include logo/demo screenshot etc.

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
13/01/2012 || 2000.00 || 3000.00
12/01/2012 || 1000.00 || 1000.00
```

### Domain Model
| Nouns     | Actions     |
| :------------- | :------------- |
| Account     | deposit, withdrawal, print_statement       |


## Code Example
Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Installation
Provide step by step series of examples and explanations about how to get a development env running.

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests
Describe and show how to run the tests with code examples.

## How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful

## License
A short snippet describing the license (MIT, Apache etc)

MIT © [Yourname]()
