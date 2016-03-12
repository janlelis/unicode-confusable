require_relative "../confusable"

class String
  # Optional core extension for your convenience
  def confusable?(other)
    Unicode::Confusable.compare(self, other)
  end
end
