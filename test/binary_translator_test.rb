require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'
require 'pry'

class BinaryTranslatorTest < Minitest::Test

  def test_it_exist
    bt = BinaryTranslator.new
    assert_instance_of BinaryTranslator, bt
  end

  def test_it_translates_a_single_character
    bt = BinaryTranslator.new
    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
  end

  def test_sanitize_creates_array_of_lowercase_characters
    bt = BinaryTranslator.new
    expected = ["t", "s", "s", "d", " ", "a", "b"]
    assert_equal expected, bt.sanitize("TSsd aB")
  end

  def test_it_translate_a_single_word
    bt = BinaryTranslator.new
    expected = "010100010101010010001001001110000111"
    actual = bt.translate("turing")
    assert_equal expected, actual
  end

  def test_it_translates_a_single_uppercase_character
    bt = BinaryTranslator.new
    assert_equal "000001", bt.translate("A")
    assert_equal "011010", bt.translate("Z")
  end

  def test_it_translate_a_single_uppercase_word
    bt = BinaryTranslator.new
    expected = "010100010101010010001001001110000111"
    assert_equal expected, bt.translate("TURING")
  end

  def test_it_translates_a_space
    bt = BinaryTranslator.new
    assert_equal "000000", bt.translate(" ")
  end

  def test_it_ignores_special_characters
    bt = BinaryTranslator.new
    assert_equal "", bt.translate("!@{$#%^&*()}")
  end

  def test_it_translates_a_sentence_with_capitals_and_symbols
    bt = BinaryTranslator.new
    expected = "001000000101001100001100001111000000010111001111010010001100000100"
    assert_equal expected, bt.translate("Hello World!")
  end

  def test_it_can_create_letters_from_binary
    bt = BinaryTranslator.new
    actual = bt.create_binary_letters("000001000001")
    expected = ["000001", "000001"]
    assert_equal expected, actual
  end

  def test_it_can_translate_from_binary_to_text
    bt = BinaryTranslator.new
    actual = bt.translate_to_text("001000000101001100001100001111000000010111001111010010001100000100")
    assert_equal "hello world", actual
  end
end
