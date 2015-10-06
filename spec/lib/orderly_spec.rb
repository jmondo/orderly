require 'spec_helper'
require 'capybara'

describe Orderly do
  let(:this) { "<p>One piece of content</p>" }
  let(:that) { "<p>Another piece of content</p>" }

  let(:page) do
    Capybara::Session.new(:rack_test, TestApp)
  end

  describe "appear_before" do
    it "asserts this is before that" do
      page.visit "/thisthenthat"
      expect(this).to appear_before(that)
    end

    it "asserts this is not before that" do
      page.visit "/thatthenthis"
      expect(this).not_to appear_before(that)
    end

    it "handles for this missing" do
      page.visit "/thisnothat"
      error_text = "Could not locate later content on page: #{that}"
      expect { expect(this).to appear_before(that) }.to raise_error error_text
      expect { expect(this).not_to appear_before(that) }.to raise_error error_text
    end

    it "handles for this missing" do
      page.visit "/thatnothis"
      error_text = "Could not locate earlier content on page: #{this}"
      expect { expect(this).to appear_before(that) }.to raise_error error_text
      expect { expect(this).not_to appear_before(that) }.to raise_error error_text
    end

    context 'handling within blocks' do

      specify "using a Capybara within block" do
        page.visit "/thisthatthis"

        within '.outer-div' do
          expect(this).to appear_before that
        end

        within '.outer-div' do
          expect(that).to_not appear_before this
        end

        within '.outer-div' do
          expect(that).to appear_before this, within: '.inner-div'
        end

        within '.outer-div' do
          expect(this).to_not appear_before that, within: '.inner-div'
        end

        expect(this).to appear_before that, within: '.outer-div'

        expect(that).to_not appear_before this, within: '.outer-div'

      end

    end

  end

end
