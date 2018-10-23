require 'pg'

class DataGenerator

  @company_representitive = ['Sarah Marcial', 'Daina Mirza', 'Rebecca Cones', 'Mike Trent', 'Josh Dimario']
  @company_email = ['monoprixadmin@monoprix.com', 'superzmarket@gmail.com', 'a2z@alphabetmarket.com', 'carrefour@carrefour.com', 'asdacompany@gmail.com']
  @company_address = ['23 Grand Avenue, E673 YU7', '45 Loren Avenue, E543 W3W', '7 Hubery Boulevard, SW78 6T5', '5 Dorrick Road Avenue, R567 G78', '32 Docoester Street, TV56 675']
  @contract_start = ['01/01/2015', '01/08/2009', '10/02/2014', '31/05/2016', '23/08/2015']
  @contract_end = ['01/01/2017', '01/08/2019', '10/02/2017', '31/05/2019', '23/08/2018']

  @company_id = ['1', '2', '3', '4', '5']
  @company_name = ['Monoprix', 'Super Z', 'A-Z', 'Carrefour', 'Asda']
  @number_of_orders = ['45', '22', '54', '2', '62']
  @total_revenue_global = [2379, 5967, 34872, 230, 45785]
  @company_telephone = ['034569810', '579456345', '568956845', '963342234', '456789653']

  @product_name = ['etlevision', 'earphones', 'watch', 'shoes', 'car']
  @gross_sale_cost = [100, 45, 30, 25, 3400]
  @distribution_price = [300, 60, 130, 37, 4500]

  @user_name = ['monop90', 'zmarkets', 'a2z', 'carrefour', 'asdaorders']
  @password = ['monop123', 'hello123', 'world123', 'car123', 'asda123']

  @order_id = [1000, 1001, 1002, 1003, 1004]
  @product_id = [1, 2, 3, 4, 5]
  @quantity = [3, 5, 7, 3, 1]
  @ordered_on = ['23/08/2018', '29/08/2018', '29/08/2018', '30/08/2018', '01/09/2018']
  @delivery_for = ['28/08/2018', '30/08/2018', '04/09/2018', '25/09/2018', '15/09/2018']
  @total_revenue_order = [900, 300, 910, 111, 4500]




  def self.create_table_data
    i = 0
    while i < @company_name.length do
      connection = PG.connect(dbname: 'clients')
      connection.exec("INSERT INTO client_details (
                      Company_Name,
                      Company_Telephone,
                      Company_Representitive,
                      Company_Email,
                      Company_Address,
                      Company_Contract_Start_Date,
                      Company_Contract_End_Date)
                      VALUES (
                        '#{@company_name[i]}',
                        '#{@company_telephone[i]}',
                        '#{@company_representitive[i]}',
                        '#{@company_email[i]}',
                        '#{@company_address[i]}',
                        '#{@contract_start[i]}',
                        '#{@contract_end[i]}');")
      connection.exec("INSERT INTO all_orders_summary (
                      Company_ID,
                      Company_Name,
                      Number_Of_Orders,
                      Total_Revenue,
                      Company_Telephone,
                      Company_Email)
                      VALUES (
                        '#{@company_id[i]}',
                        '#{@company_name[i]}',
                        '#{@number_of_orders[i]}',
                        '#{@total_revenue_global[i]}',
                        '#{@company_telephone[i]}',
                        '#{@company_email[i]}');")
      connection.exec("INSERT INTO orders (
                      order_id,
                      Company_ID,
                      Company_Name,
                      Product_ID,
                      Quantity,
                      Ordered_On_Date,
                      Delivery_Date,
                      Total_Revenue)
                      VALUES (
                        '#{@order_id[i]}',
                        '#{@company_id[i]}',
                        '#{@company_name[i]}',
                        '#{@product_id[i]}',
                        '#{@quantity[i]}',
                        '#{@ordered_on[i]}',
                        '#{@delivery_for[i]}',
                        '#{@total_revenue_order[i]}');")
      connection.exec("INSERT INTO users (
                      Company_ID,
                      Company_Name,
                      Company_Telephone,
                      Company_Email,
                      Password,
                      Username)
                      VALUES (
                        '#{@company_id[i]}',
                        '#{@company_name[i]}',
                        '#{@company_telephone[i]}',
                        '#{@company_email[i]}',
                        '#{@password[i]}',
                        '#{@user_name[i]}');")
      connection.exec("INSERT INTO product_values (
                      Product_Name,
                      gross_sale_cost,
                      distribution_price)
                      VALUES (
                        '#{@product_name[i]}',
                        '#{@gross_sale_cost[i]}',
                        '#{@distribution_price[i]}');")
    i += 1
    end
  end
end

DataGenerator.create_table_data
