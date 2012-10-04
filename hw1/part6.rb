class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key? singular_currency
      return self / @@currencies[singular_currency]
    end
    self # TODO: raise error?
  end
end

class String
  def palindrome?
    str = self.gsub(/[^\w]/, '').downcase
    str == str.reverse
  end
end

module Enumerable
  def palindrome?
    arr = self.to_a
    arr == arr.reverse
  end
end
