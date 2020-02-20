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

```ruby
let(:this) { "<li>Andrea</li>" }
let(:that) { "<li>Luis</li>" }

expect(this).to appear_before(that)

# or use capybara elements
this = find('.this')
that = find('.that')

expect(this).to appear_before(that)
```

To assert that something does not appear before

```ruby
expect(this).to_not appear_before(that)
```

By default, `appear_before` matches against HTML. If you want to only compare text, use the `only_text`-option:

```ruby
# <dl>
#   <dt>First name:</dt>
#   <dd>Andrea</dt>
#
#   <dt>Last name:</dt>
#   <dd>Robbinovich</dt>
# </dl>

expect("First name: Andrea").to appear_before("Last name: Robbinovich", only_text: true)
```

## Changelog
### 0.1.1 (2020-02-20)
- Add support for `only_text`-option
- Add support for using capybara nodes

### 0.1.0 (2019-08-08)
- Add support for capybara `within`-blocks

## Contributing
Patches welcome! Submit a pull request.
