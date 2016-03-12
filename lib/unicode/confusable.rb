require_relative "confusable/constants"
require_relative "confusable/index"

require 'unicode_normalize/normalize'

module Unicode
  module Confusable
    def self.confusable?(string1, string2)
      skeleton(string1) == skeleton(string2)
    end

    def self.skeleton(string)
      require_relative 'display_width/index' unless defined? ::Unicode::Confusable::INDEX
      UnicodeNormalize.normalize(
        UnicodeNormalize.normalize(string, :nfd).each_codepoint.map{ |codepoint|
          INDEX[codepoint] || codepoint
        }.flatten.pack("U*"), :nfd
      )
    end
  end
end

