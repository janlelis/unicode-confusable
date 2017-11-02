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

  describe ".list(char)" do
    it "will return list of confusables for a character, also confusables where given character is part of" do
      assert_equal ["⒪", "ꜵ", "℅", "ᴔ", "ꭁ", "ꭂ", "ﷲ", "№", "ం", "ಂ", "ം", "ං", "०", "੦", "૦", "௦", "౦", "೦", "൦", "๐", "໐", "၀", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "о", "ჿ", "օ", "ס", "ه", "𞸤", "𞹤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ഠ", "ဝ", "𐓪", "𑣈", "𑣗", "𐐬", "ۿ", "ø", "ꬾ", "ɵ", "ꝋ", "ө", "ѳ", "ꮎ", "ꮻ", "ꭴ", "ﳙ", "ơ", "œ", "ɶ", "∞", "ꝏ", "ꚙ", "ﳗ", "ﱑ", "ﳘ", "ﱒ", "ﶓ", "ﶔ", "ﱓ", "ﱔ", "ൟ", "တ", "ꭣ", "ﲠ", "ﳢ", "ﲥ", "ﳤ", "ﷻ", "ﴱ", "ﳨ", "ﴲ", "ﳪ", "ﷺ", "ﷷ", "ﳍ", "ﳖ", "ﳯ", "ﳞ", "ﳱ", "ﳦ", "ﲛ", "ﳠ", "ﯭ", "ﯬ"] , Unicode::Confusable.list("o")
    end
  end

  describe ".list(char, false)" do
    it "will return list of confusables for a character, only direct confusables" do
      assert_equal ["ం", "ಂ", "ം", "ං", "०", "੦", "૦", "௦", "౦", "೦", "൦", "๐", "໐", "၀", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "о", "ჿ", "օ", "ס", "ه", "𞸤", "𞹤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ഠ", "ဝ", "𐓪", "𑣈", "𑣗", "𐐬"] , Unicode::Confusable.list("o", false)
    end
  end
end

