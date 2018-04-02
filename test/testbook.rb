require '../lib/detectBookGenre/book'
require 'test/unit'

class TestBook < Test::Unit::TestCase

  def setup
    @book = Book.new('mytitle','mydescription')
  end

  def testTitle
    assert_equal('mytitle',@book.title)
  end

  def testDescription
    assert_equal('mydescription',@book.description)
  end

end
