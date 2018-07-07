class BinaryTranslator
  def initialize
    @alpha_to_binary = {
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010",
      " " => "000000"
    }
  end

  def translate(text)
    characters = sanitize(text)
    binary_characters = characters.map do |character|
      @alpha_to_binary[character]
    end
    binary_characters.join
  end

  def sanitize(dirty)
    dirty.downcase.chars
  end

  def translate_to_text(binary)
    binary_to_alpha = @alpha_to_binary.invert
    binary_letters = create_binary_letters(binary)
    letters = binary_letters.map do |letter|
      binary_to_alpha[letter]
    end
    letters.join
  end

  def create_binary_letters(binary_text)
    binary_letters = []
    binary_text.chars.each_slice(6) do |letter_array|
      binary_letters << letter_array.join
    end
    return binary_letters
  end
end
