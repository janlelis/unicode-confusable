module Unicode
  module Confusable
    VERSION = "1.0.1".freeze
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + '/../../../data/').freeze
    INDEX_FILENAME = (DATA_DIRECTORY + '/confusable.marshal.gz').freeze
  end
end

