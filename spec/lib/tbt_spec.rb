require 'spec_helper'

describe Tbt do
  let(:this) { "<p>The first piece of content</p>" }
  let(:that) { "<p>The second piece of content</p>" }

  let(:page) do
    mockery = mock
    mockery.stubs(:body).returns(html)
    mockery
  end

  describe "affirmative" do
    let(:html) { this + that }
    it "asserts this is before that" do
      this.should appear_before(that)
    end
  end

  describe "negative" do
    let(:html) { that + this }
    it "asserts this is not before that" do
      this.should_not appear_before(that)
    end
  end
end
