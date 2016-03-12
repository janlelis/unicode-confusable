require_relative "../lib/unicode/confusable"
require "minitest/autorun"

describe Unicode::Confusable do
  it "will detect official confusables" do
    assert_equal true, Unicode::Confusable.confusable?("1", "l")
    assert_equal true, Unicode::Confusable.confusable?("ℜ𝘂ᖯʏ", "Ruby")
    assert_equal true, Unicode::Confusable.confusable?("Michael", "Michae1")
    assert_equal true, Unicode::Confusable.confusable?("⁇", "??")
  end

  it "will return false for non-confusables" do
    assert_equal false, Unicode::Confusable.confusable?("a", "b")
    assert_equal false, Unicode::Confusable.confusable?("⁇", "?")
  end
end

