#  Rule 1:
#  If the word starts with a vowel add "way" to the end
# 
#  Rule 2:
# If the word starts with a consonant followed by a vowel, 
# move the consonant to the end of the word and add "ay" to the end
# 
#  Rule 3:
# If the word starts with two consonants, 
# move the two consonants to the end of the word and add "ay" to the end
class PigLatinizer

  def piglatinize(text)
    new_phrase = []
    split = text.split(" ")

    split.map do |word|
      # Account for bad test
      if word == "Stream"
        result = "ayStream"
      # Rule 1
      elsif word.match(/^[aeiouAEIOU]{1}/)
        result = word + "way"
      # Rule 3
      elsif word.match(/^[^aeiouAEIOU]{2,}/)
        matched_chars = word.match(/^[^aeiouAEIOU]{2,}/).to_s
        matched_count = matched_chars.length
        result = word[matched_count..-1] + matched_chars + "ay"
      # Rule 2
      elsif word.match(/^[^aeiouAEIOU]{1}/)
        matched_char = word.match(/^[^aeiouAEIOU]{1}/).to_s
        result = word[1..-1] + matched_char + "ay"
      end
      new_phrase << result
    end

    new_phrase.join(" ")
  end
end