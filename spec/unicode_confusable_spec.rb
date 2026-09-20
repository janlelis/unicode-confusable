require_relative "../lib/unicode/confusable"
require "minitest/autorun"

describe Unicode::Confusable do
  describe ".confusable?(string1, string2)" do
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

  describe ".skeleton(string)" do
    it "returns internal skeleton representation" do
      assert_equal "Ruby", Unicode::Confusable.skeleton("ℜ𝘂ᖯʏ")
    end

    it "will remove default ignorable codepoints" do
      assert_equal "ab", Unicode::Confusable.skeleton("a\u{FE0F}b")
    end
  end

  describe ".list(char)" do
    it "will return list of confusables for a character, also confusables where given character is part of" do
      assert_equal ["⒪", "㈇", "㈕", "㈝", "㈞", "ꜵ", "℅", "ꭃ", "ꭄ", "㏇", "ᴔ", "ꭁ", "ꭂ", "㏒", "ﷲ", "№", "ం", "ಂ", "ം", "ං", "𑌂", "०", "০", "੦", "૦", "୦", "௦", "౦", "൦", "๐", "໐", "၀", "០", "᪀", "᪐", "𑓐", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "ϭ", "о", "ᲂ", "ჿ", "օ", "ס", "ه", "𞸤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ࡀ", "ߋ", "ഠ", "ᯪ", "ဝ", "𐴇", "𑄤", "ᩅ", "𐓪", "ᄋ", "ㅇ", "ﾷ", "ᆼ", "𑣈", "𑣗", "𐤬", "𐐬", "ۿ", "ة", "ﺔ", "ﺓ", "ۃ", "ø", "ꬾ", "ꚢ", "ɵ", "ꝋ", "ⲑ", "ө", "ѳ", "ꮎ", "ꮻ", "ꭴ", "ﮥ", "ﮤ", "ﳙ", "œ", "ɶ", "\u{1DF5E}", "𞹤", "∞", "ꝏ", "ꚙ", "ᅇ", "ㆀ", "ᇮ", "\u{1DF5F}", "㍵", "ѹ", "ﳗ", "ﱑ", "ﳘ", "ﱒ", "ﶓ", "ﶔ", "ﱓ", "ﱔ", "ൟ", "თ", "တ", "𑄖", "ᨲ", "ᅁ", "ᇬ", "ᇭ", "ᅂ", "ꥶ", "ᅃ", "ᅄ", "ᅅ", "ᇱ", "ㆂ", "ᅈ", "ᅉ", "ᇯ", "ᅊ", "ᅋ", "ꥷ", "ᅆ", "ᇲ", "ㆃ", "㏖", "ꭣ", "ﲠ", "ﳢ", "ﲥ", "ﳤ", "ﷻ", "𞱵", "ﴱ", "ﳨ", "ﴲ", "ﳪ", "ﷺ", "𞲱", "ﷷ", "𞲣", "ﳍ", "𞲟", "𞲞", "ﳖ", "ﳯ", "ﳞ", "ﳱ", "ﳦ", "ﲛ", "ﳠ", "ﯭ", "ﯬ", "ᄛ", "ퟝ", "ꥫ", "ᇕ", "ᄝ", "ㅱ", "ᇢ", "ᄫ", "ㅸ", "ᇦ", "ᄬ", "ㅹ", "ᄵ", "ퟫ", "ᅍ", "ᅗ", "ㆄ", "ᇴ", "ퟴ"], Unicode::Confusable.list("o")
    end
  end

  describe ".list(char, false)" do
    it "will return list of confusables for a character, only direct confusables" do
      assert_equal ["ం", "ಂ", "ം", "ං", "𑌂", "०", "০", "੦", "૦", "୦", "௦", "౦", "൦", "๐", "໐", "၀", "០", "᪀", "᪐", "𑓐", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "ϭ", "о", "ᲂ", "ჿ", "օ", "ס", "ه", "𞸤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ࡀ", "ߋ", "ഠ", "ᯪ", "ဝ", "𐴇", "𑄤", "ᩅ", "𐓪", "ᄋ", "ㅇ", "ﾷ", "ᆼ", "𑣈", "𑣗", "𐤬", "𐐬"], Unicode::Confusable.list("o", false)
    end
  end
end

