

class PizzaOrder

  attr_accessor :first_name, :last_name, :quantity, :topping

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @quantity = options['quantity'].to_i
    @topping = options['topping']
  end

  

end
