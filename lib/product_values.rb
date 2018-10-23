require 'pg'

class ProductValues
  attr_reader :product_id,:product_name,:gross_sale_cost,:distribution_price

  def initialize(product_id,product_name,gross_sale_cost,distribution_price)
    @product_id = product_id
    @product_name = product_name
    @gross_sale_cost = gross_sale_cost
    @distribution_price = distribution_price
  end

  def self.get_all
    connection = PG.connect(dbname: 'clients')
    result = connection.exec("SELECT * FROM product_values")
    result.map {|row| ProductValues.new(row['product_id'],
                                          row['product_name'],
                                          row['gross_sale_cost'],
                                          row['distribution_price'])}
  end
end
