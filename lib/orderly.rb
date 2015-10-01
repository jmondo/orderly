require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content, within_matcher|
    match do |earlier_content|
      begin
        if within_matcher
          page.find(within_matcher[:within]).native.inner_html.index(earlier_content) < page.find(within_matcher[:within]).native.inner_html.index(later_content)
        else
          page.body.index(earlier_content) < page.body.index(later_content)
        end
      rescue ArgumentError
        raise "Could not locate later content on page: #{later_content}"
      rescue NoMethodError
        raise "Could not locate earlier content on page: #{earlier_content}"
      end
    end
  end
end
