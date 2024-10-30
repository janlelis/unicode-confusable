require_relative 'index' unless defined? ::Unicode::Confusable::INDEX

module Unicode
  module Confusable
  	IGNORABLE = INDEX[:IGNORABLE].reduce([]){|acc, cur|
  	  acc + [*(cur.is_a?(Array) ? Range.new(*cur) : cur)]
  	}.freeze
  end
end