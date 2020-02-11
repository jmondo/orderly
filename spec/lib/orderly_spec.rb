require 'spec_helper'
require 'capybara'

describe Orderly do
  let(:this) { "<p>One piece of content</p>" }
  let(:that) { "<p>Another piece of content</p>" }

  let(:capybara_driver) { ENV.fetch("DRIVER", :rack_test).to_sym }
  let(:page) { Capybara::Session.new(capybara_driver, TestApp) }

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

    context "handling within blocks" do
      specify "using a Capybara within block" do
        page.visit "/thatthisthatthis"

        expect(that).to appear_before this

        page.within ".outer-div" do
          expect(this).to appear_before that
          expect(that).to_not appear_before this
        end

        page.within ".inner-div" do
          expect(that).to appear_before this
          expect(this).to_not appear_before that
        end
      end
    end

    context "when only_text option is passed" do
      context "when that is equal to option from HTML" do
        let(:this) { "ability" }
        let(:that) { "option" }

        it "asserts this is before that" do
          page.visit "/options"

          expect(this).to appear_before(that, only_text: true)
        end
      end

      context "when text is split in HTML" do
        let(:this) { "First name: Andrea" }
        let(:that) { "Last name: Robbinovich" }

        it "asserts this is before that" do
          page.visit "/description-list"

          expect(this).to appear_before(that, only_text: true)
        end
      end
    end
  end
end
