require('pg')
require("pry")

class PizzaOrder

  attr_accessor :first_name, :last_name, :quantity, :topping

  def initialize(options)
    @id = options['id'].to_i if options['id']
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
            VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @quantity, @topping]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    # binding.pry
    @id = result[0]['id'].to_i
    db.close
  end

  def PizzaOrder.all
    db = PG.connect({
      dbname: 'pizza_shop',
      host: 'localhost'
      })
    sql = "SELECT * FROM pizza_orders"
    db.prepare("all", sql)
    orders = db.exec_prepared("all")
    db.close
    return orders.map { |order| PizzaOrder.new(order) }
  end

  def PizzaOrder.delete_all
    db = PG.connect({
      dbname: 'pizza_shop',
      host: 'localhost'
      })
    sql = "DELETE FROM pizza_orders"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

end
