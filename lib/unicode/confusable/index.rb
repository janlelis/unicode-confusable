require_relative 'constants'

module Unicode
  module Confusable
    INDEX = Marshal.load(Gem.gunzip(File.binread(INDEX_FILENAME)))
  end
end
