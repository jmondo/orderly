require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content, only_text: false|
    match do |earlier_content|
      begin
        node = page.respond_to?(:current_scope) ? page.current_scope : page.send(:current_node)
        data = only_text ? text_for_node(node) : html_for_node(node)

        data.index(html_for_node(earlier_content)) < data.index(html_for_node(later_content))
      rescue ArgumentError
        raise "Could not locate later content on page: #{later_content}"
      rescue NoMethodError
        raise "Could not locate earlier content on page: #{earlier_content}"
      end
    end

    def html_for_node(node)
      if node.is_a?(String)
        node
      elsif node.is_a?(Capybara::Node::Document)
        html_for_node(node.find(:xpath, '//body'))
      elsif node.native.respond_to?(:inner_html)
        node.native.inner_html
      else
        page.driver.evaluate_script("arguments[0].innerHTML", node.native)
      end
    end

    def text_for_node(node)
      # NOTE: we need ot normalize spaces due to differences between rack-test
      # and headless chrome.
      node.text.gsub(/[[:space:]]+/, ' ').strip
    end
  end
end
