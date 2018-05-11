require 'minitest/unit'
require 'minitest/autorun'
require 'deckofcards'

class CardTest < MiniTest::Unit::TestCase
  def setup
    @deck = PlayingCards::Deck.new
  end

  def test_deal_one
    @deck.deal
    assert_equal(51, @deck.size)
  end

  def test_deal_any
    @deck.deal(5)
    assert_equal(47, @deck.size)
  end
end