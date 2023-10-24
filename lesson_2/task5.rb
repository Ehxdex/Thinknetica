=begin
    Заданы три числа, которые обозначают число, месяц, год
  (запрашиваем у пользователя). Найти порядковый номер даты, 
  начиная отсчет с начала года. Учесть, что год может быть 
  високосным. (Запрещено использовать встроенные в ruby методы 
  для этого вроде Date#yday или Date#leap?
=end

puts "Укажите день:"
day = gets.chomp.to_i
puts "Укажите месяц:"
month = gets.chomp.to_i
puts "Укажите год"
year = gets.chomp.to_i

result = 0

months_length = [30, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
  puts "Год #{year} високосный"
  months_length[1] = 29
else 
  puts "Год #{year} не является високосным"
end

result = months_length[0...(month-1)].sum + day
puts "#{result} день года."