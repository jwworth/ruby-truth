require 'minitest/autorun'
require './ruby_truth.rb'

class TestRubyTruth < Minitest::Test
  def setup
    @rt = RubyTruth.new
  end

  def test_true
    assert_equal 'true', @rt.evaluate(true)
  end

  def test_false
    assert_equal 'false', @rt.evaluate(false)
  end

  def test_false_statement
    assert_equal 'false', @rt.evaluate(false && false)
  end

  def test_true_statement
    assert_equal 'true', @rt.evaluate(true && true)
  end

  def test_truthy_integer
    assert_equal 'truthy', @rt.evaluate(rand(5))
  end

  def test_nil
    assert_equal 'falsey', @rt.evaluate(nil)
  end

  def test_truthy_statement
    assert_equal 'truthy', @rt.evaluate('5 || 5')
  end

  def test_falsey_statement
    assert_equal 'falsey', @rt.evaluate('nil && nil')
  end

  def test_truthy_statement_with_numbers
    assert_equal 'truthy', @rt.evaluate('false || 9')
  end

  def test_false_statement_with_numbers
    assert_equal 'false', @rt.evaluate('false && 9')
  end
end
