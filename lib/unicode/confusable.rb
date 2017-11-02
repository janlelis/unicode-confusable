require_relative "confusable/constants"

require 'unicode_normalize/normalize'

module Unicode
  module Confusable
    def self.confusable?(string1, string2)
      skeleton(string1) == skeleton(string2)
    end

    def self.skeleton(string)
      require_relative 'confusable/index' unless defined? ::Unicode::Confusable::INDEX
      UnicodeNormalize.normalize(
        UnicodeNormalize.normalize(string, :nfd).each_codepoint.map{ |codepoint|
          INDEX[codepoint] || codepoint
        }.flatten.pack("U*"), :nfd
      )
    end

    def self.list(char, partial_mapping_allowed = true)
      require_relative 'confusable/index' unless defined? ::Unicode::Confusable::INDEX
      codepoint = char.codepoints.first or raise ArgumentError, "no data given to Unicode::Confusable.list"
      if partial_mapping_allowed
        INDEX.select{ |k,v| v == codepoint || v.is_a?(Array) && v.include?(codepoint) }.keys.map{ |codepoint| [codepoint].pack("U*") }
      else
        INDEX.select{ |k,v| v == codepoint }.keys.map{ |codepoint| [codepoint].pack("U") }
      end
    end
  end
end

