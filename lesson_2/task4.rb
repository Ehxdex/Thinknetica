=begin
  Заполнить хеш гласными буквами, где значением будет
  являтся порядковый номер буквы в алфавите (a - 1). 
=end

hh = Hash.new

vowels = "aeiou"
arr = ("a".."z").to_a
arr.each_with_index do |vowel, ind|
  if vowels.include?(vowel)
    hh[vowel] = ind
  end
end
p hh