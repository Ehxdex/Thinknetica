puts "Основание треугольника: "
a = STDIN.gets.chomp.to_f
puts "Высота треугольника: "
h = STDIN.gets.chomp.to_f

area = 1.to_f/2 * a * h
puts "Площадь треугольника равна: #{area}"