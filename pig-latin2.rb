# Place your answer here


#get a word from user input


#if the word starts with vowel, don't change it.
#else, replace the word with its pig latin equivalent
#GET all the consonants before the first vowel in the word
#SET the consonants at the end of the word and add the suffix "ay"
#ENDIF 
#Print pig-latin-ified word
#vowel = ["a","e","i","o","u"]

require 'byebug'

def translate(sent)
    sent = sent.downcase
    vowels = ['a', 'e', 'i', 'o', 'u']
    word = sent.split(//) #change into array
    result = []

    word.each_with_index do |x, index|
        if vowels.include?(x)
            return sent + "ay"
        else
            return word[1..-1].join + word[0] + "ay"　　#[1..-1]はindexの2つ目から最後までという意味。
        end
    end


end


p ARGV
p ARGV.class  #ARGVのclassを調べる
p ARGV.join　　#ARGVがarrayなので.joinメソッドでstringに変更する
p translate(ARGV.join)  #=> apple
# translate('banana') #-> ananabay    


# def translate(sent)
#     sent = sent.downcase
#     vowels = ['a', 'e', 'i', 'o', 'u']
#     words = sent.split(' ') #change into array
#     result = []

# words.each_with_index do |word, i|
#     translation = ''
#     qu = false
#     if vowels.include? word[0]
#         p word
#         translation = word + 'ay'
#         result.push(translation)
#     else
#         word = word.split('')
#         count = 0
#         word.each_with_index do |char, index|
#             if vowels.include? char
#                 # handle words that start with 'qu'
#                 if char == 'u' and translation[-1] == 'q'
#                     qu = true
#                     translation = words[i][count + 1..words[i].length] + translation + 'uay'
#                     result.push(translation)
#                     next
#                 end
#                 break
#             else
#                 # handle words with 'qu' in middle
#                 if char == 'q' and word[i+1] == 'u'
#                     qu = true
#                     translation = words[i][count + 2..words[i].length] + 'quay'
#                     result.push(translation)
#                     next
#                 else
#                     translation += char
#                 end
#                 count += 1
#             end
#         end
#         # translation of consonant words without qu
#         if not qu
#             translation = words[i][count..words[i].length] + translation + 'ay'
#             result.push(translation)
#         end
#     end

# end
# result.join(' ')
# end


           # "appleay"
# puts translate("quiet")                # "ietquay"
# puts translate("square")               # "aresquay"
# puts translate("the quick brown fox")  # "ethay ickquay ownbray oxfay"


