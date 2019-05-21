require('pg')

class PizzaOrder

  attr_accessor :first_name, :last_name, :quantity, :topping

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @quantity = options['quantity'].to_i
    @topping = options['topping']
  end

  def save()
    db = PG.connect({
      dbname: 'pizza_shop',
      host: 'localhost'
      })
    sql = "INSERT INTO pizza_orders
          (first_name,
            last_name,
            quantity,
            topping)
            VALUES (
              '#{@first_name}',
              '#{@last_name}'
              #{@quantity},
              '#{@topping}'
              )"
    db.exec(sql)
    db.close
  end

end
