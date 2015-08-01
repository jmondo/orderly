# Orderly

Rspec matcher for asserting that this appears_before(that) in rspec request specs

## Installation

Add this line to your application's Gemfile:

    gem 'orderly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orderly

## Usage

In an rspec request spec, do

    this.should appear_before(that)
    # or
    expect(this).to appear_before(that)

or, to assert that something does not appear before

    this.should_not appear_before(that)
    # or
    expect(this).to_not appear_before(that)
    
Error handling in place for cases where this or that does not appear on the page.

## Contributing
Patches welcome! Submit a pull request.
