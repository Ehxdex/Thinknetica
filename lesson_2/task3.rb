=begin
  Заполнить массив числами фибоначчи до 100
=end

# Вариант 1
fibonacci = [0, 1]
loop do 
  num = fibonacci[-1] + fibonacci[-2]
  break if num >= 100
  fibonacci << num
end
p fibonacci

# Вариант 2
# fib = [0, 1]
# while fib[-1] < 100
#   fib << fib[-2] + fib[-1]
# end
# p fib

# Вариант 3 
# n1 = 0
# n2 = 1
# fib2 = []
# fib2.push(n1, n2)
# begin
#   n3 = n1 + n2
#   n1 = n2
#   n2 = n3
#   fib2 << n3
# end while n3 < 100
# p fib2