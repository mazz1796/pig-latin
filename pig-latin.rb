# Place your answer here


#get a word from user input


#if the word starts with vowel, don't change it.
#else, replace the word with its pig latin equivalent
#GET all the consonants before the first vowel in the word
#SET the consonants at the end of the word and add the suffix "ay"
#ENDIF 
#Print pig-latin-ified word

#vowel = ["a","e","i","o","u"]
def translate(sent)
    sent = sent.downcase
    vowels = ['a', 'e', 'i', 'o', 'u']
    words = sent.split(' ')
    result = []

words.each_with_index do |word, i|
    translation = ''
    qu = false
    if vowels.include? word[0]
        translation = word + 'ay'
        result.push(translation)
    else
        word = word.split('')
        count = 0
        word.each_with_index do |char, index|
            if vowels.include? char
                # handle words that start with 'qu'
                if char == 'u' and translation[-1] == 'q'
                    qu = true
                    translation = words[i][count + 1..words[i].length] + translation + 'uay'
                    result.push(translation)
                    next
                end
                break
            else
                # handle words with 'qu' in middle
                if char == 'q' and word[i+1] == 'u'
                    qu = true
                    translation = words[i][count + 2..words[i].length] + 'quay'
                    result.push(translation)
                    next
                else
                    translation += char
                end
                count += 1
            end
        end
        # translation of consonant words without qu
        if not qu
            translation = words[i][count..words[i].length] + translation + 'ay'
            result.push(translation)
        end
    end

end
result.join(' ')
end

puts translate('apple')                # "appleay"
puts translate("quiet")                # "ietquay"
puts translate("square")               # "aresquay"
puts translate("the quick brown fox")  # "ethay ickquay ownbray oxfay"


