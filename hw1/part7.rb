class CartesianProduct
  include Enumerable

  def initialize(a, b)
    @a = a
    @b = b
  end

  def each
    @a.each do |x|
      @b.each { |y| yield [x, y] }
    end
  end
end
