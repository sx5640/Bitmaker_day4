class Goods
  attr_accessor :name, :amount, :price, :tax_rate, :after_tax

  def tax
    self.after_tax = (amount * price * (1 + tax_rate)).round(2)
  end
end

class Imported < Goods
  def initialize(amount = 0, price = 0, tax_rate = 0.05)
    @amount = amount
    @price = price
    @tax_rate = tax_rate
  end
end

class Local < Goods
  def initialize(amount = 0, price = 0, tax_rate = 0.10)
    @amount = amount
    @price = price
    @tax_rate = tax_rate
  end
end

class Special < Goods
  def initialize(amount = 0, price = 0, tax_rate = 0)
    @amount = amount
    @price = price
    @tax_rate = tax_rate
  end
end

Special_List = ["chocolates", "chocolate bar", "book", "headache pills"]

def is_special(item)
  temp = false
  Special_List.each do |special|
    temp = temp || item.include?(special)
  end
  return temp
end

def what_class(cart)
  if cart.include?("imported")
    Imported.new(cart[0].to_i, cart[-1].to_f)
  elsif is_special(cart)
    Special.new(cart[0].to_i, cart[-1].to_f)
  else
    Local.new(cart[0].to_i, cart[-1].to_f)
  end
end

count = 0
cart = []
item = []
sum = 0
sales_tax = 0
while true
  puts "input the item on your cart. like '1 imported box of chocolates at 10.00' or '1 book at 12.49'"
  cart[count] = gets.chomp.split(" ")
  if cart[count][0] == "none"
    break
  else
    item[count] = what_class(cart[count])
    item[count].tax
    cart[count][-1] = (item[count].after_tax).round(2)
    sum += item[count].after_tax
    puts sum
    puts "what is on the list \n#{item}"
    sales_tax += (item[count].amount * item[count].price * item[count].tax_rate).round(2)
  end

  count += 1
end

cart.each do |cart|
  puts cart[0..-3].join(" ") + ":#{cart[-1]}"
end

puts "Sales Taxes: #{sales_tax}"
puts "Total: #{sum}"
