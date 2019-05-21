require("pry")
require_relative('models/pizza_order.rb')

PizzaOrder.delete_all

order1 = PizzaOrder.new(
  {
    'first_name' => 'Adam',
    'last_name' => 'Houten',
    'quantity' => 2,
    'topping' => 'pepperoni'
  }
)

order2 = PizzaOrder.new(
  {
    'first_name' => 'Louise',
    'last_name' => 'Reed',
    'quantity' => 1,
    'topping' => 'cheese'
  }
)

order1.save
order2.save

orders = PizzaOrder.all

order1.delete



binding.pry
nil
