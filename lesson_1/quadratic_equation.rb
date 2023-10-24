puts "Введите 1 коэффициент"
a = STDIN.gets.chomp.to_i
puts "Введите 2 коэффициент"
b = STDIN.gets.chomp.to_i
puts "Введите 3 коэффициент"
c = STDIN.gets.chomp.to_i

# Вычисление дискриминанта
d = b**2 - 4 * a * c

if d > 0
  puts "Дискриминант равен: #{d}"
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  puts "Первый корень х1 равен: #{x1}"
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "Второй корень х2 равен: #{x1}"
elsif d == 0
  puts "Дискриминант равен: #{d}"
  x1 = -b / (a*2)
  puts "Оба корня одинаковые х1 = х2 = #{x1}"
elsif d < 0
  puts "Корней нет."
else
  puts "Иное значение."
end