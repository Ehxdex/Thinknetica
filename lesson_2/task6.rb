=begin
  Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу 
  и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести 
  произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
  На основе введенных данных требуетеся:
    Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
  а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. 
    Также вывести итоговую сумму за каждый товар.
  Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

hh = Hash.new
flag = false

while flag != true
  puts "Введите название товара:"
  product_name = gets.chomp
  puts "Введите цену за единицу товара:"
  unit_price = gets.chomp.to_f
  puts "Введите количество товара к приобретению:"
  count = gets.chomp.to_i

  if product_name == "" || unit_price == ""
    puts "Вы не ввели название товара или цену"
  elsif product_name == "стоп" || unit_price == "стоп"
    flag = true
  else
    hh[product_name] = {unit_price => count}
  end
end

total_price = 0

hh.each do |k, v|
  v.each do |p, c|
    puts "Вы купили: -#{k}, по цене: #{p} руб., #{c} шт. "
    puts "#{k} цена: #{p * c} руб."
    total_price += (p * c)
  end
end 

puts "Общая сумма покупок: #{total_price} руб."