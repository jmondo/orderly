require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content, only_text: false|
    match do |earlier_content|
      begin
        node = page.respond_to?(:current_scope) ? page.current_scope : page.send(:current_node)
        data = only_text ? text_for_node(node) : html_for_node(node)

        data.index(extract_content(earlier_content)) < data.index(extract_content(later_content))
      rescue ArgumentError
        raise "Could not locate later content on page: #{later_content}"
      rescue NoMethodError
        raise "Could not locate earlier content on page: #{earlier_content}"
      end
    end

    def html_for_node(node)
      if node.is_a?(Capybara::Node::Document)
        html_for_node(node.find(:xpath, '//body'))
      elsif node.native.respond_to?(:to_html)
        node.native.to_html
      else
        node.evaluate_script("this.outerHTML")
      end
    end

    def extract_content(node)
      if node.is_a?(String)
        node
      else
        html_for_node(node)
      end
    end

    def text_for_node(node)
      # NOTE: we need to normalize spaces due to differences between rack-test
      # and headless chrome.
      node.text.gsub(/[[:space:]]+/, ' ').strip
    end
  end
end
