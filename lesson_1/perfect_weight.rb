puts "Введите ваше имя."
name = STDIN.gets.chomp
puts "Введите ваш рост."
height = STDIN.gets.chomp.to_i

perfect_weight = (height - 110) * 1.15

if perfect_weight < 0
  puts "Ваш вес уже оптимальный."
else  
  puts "Уважаемый, #{name}. Ваш вес: #{perfect_weight.to_i} кг."
end