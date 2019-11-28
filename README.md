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

  this.should appear_before(that)
  # or
  expect(this).to appear_before(that)
```

or, to assert that some html does not appear before another

```ruby
  let(:this) { "<li>Andrea</li>" }
  let(:that) { "<li>Luis</li>" }

  this.should_not appear_before(that)
  # or
  expect(this).to_not appear_before(that)
```

Error handling in place for cases where this or that does not appear on the page.

###WARNING####

The `appear_before` be default matches against the html it means the following case would fail if you won't use `only_text` option:

```ruby
  let(:this) { "ability" }
  let(:that) { "option" }

  # Supposed that the page under / looks like
  ##
  ## <html>
  ##   <body>
  ##     <select>
  ##       <option>ability</option>
  ##       <option>option</option>
  ##     </select>
  ##   </body>
  ## </html>

  scenario "user see ordered options" do
    visit "/"

    expect(this).to appear_before(that)
  end
```

This might lead to flaky specs be aware when use without that option.
To make the scenario pass we need add that option:

```ruby
  let(:this) { "ability" }
  let(:that) { "option" }

  # Supposed that the page under / looks like
  ##
  ## <html>
  ##   <body>
  ##     <select>
  ##       <option>ability</option>
  ##       <option>option</option>
  ##     </select>
  ##   </body>
  ## </html>

  scenario "user see ordered options" do
    visit "/"

    expect(this).to appear_before(that, only_text: true)
  end
```

Also it works with text that's split in HTML:

```ruby
  let(:this) { "First name: Andrea" }
  let(:that) { "Last name: Robbinovich" }

  # Supposed that the page under / looks like
  ##
  ## "<dl>
  ##   <dt>First name:</dt>
  ##   <dd>Andrea</dt>
  ##
  ##   <dt>Last name:</dt>
  ##   <dd>Robbinovich</dt>
  ## </dl>"

  scenario "user see ordered options" do
    visit "/"

    expect(this).to appear_before(that, only_text: true)
  end
```

## Changelog
### 0.1.1 (2019-11-28)
- Add support for `only_text` option to remove html from scope it matches to

### 0.1.0 (2019-08-08)
- Add support for capybara `within`-blocks

## Contributing
Patches welcome! Submit a pull request.
