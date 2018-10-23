require 'pg'

class DatabaseCreator

  def self.create_database
    connection = PG.connect(dbname: 'postgres')
    connection.exec('CREATE DATABASE clients')
  end

  def self.create_tables
    connection = PG.connect(dbname: 'clients')
    connection.exec('CREATE TABLE client_details (
                    Company_ID SERIAL PRIMARY KEY,
                    Company_Name varchar,
                    Company_Telephone varchar,
                    Company_Representitive varchar,
                    Company_Email varchar,
                    Company_Address varchar,
                    Company_Contract_Start_Date varchar,
                    Company_Contract_End_Date varchar
                    )')
    connection = PG.connect(dbname: 'clients')
    connection.exec('CREATE TABLE all_orders_summary (
                    Summary_ID SERIAL PRIMARY KEY,
                    Company_ID int,
                    Company_Name varchar,
                    Number_Of_Orders int,
                    Total_Revenue int,
                    Company_Telephone varchar,
                    Company_Email varchar
                    )')
    connection = PG.connect(dbname: 'clients')
    connection.exec('CREATE TABLE orders (
                    Row_ID SERIAL PRIMARY KEY,
                    order_id varchar,
                    Company_ID int,
                    Company_Name varchar,
                    Product_ID int,
                    Quantity int,
                    Ordered_On_Date text,
                    Delivery_Date text,
                    Total_Revenue int
                    )')
      connection = PG.connect(dbname: 'clients')
      connection.exec('CREATE TABLE users (
                      User_ID SERIAL PRIMARY KEY,
                      Company_ID int,
                      Company_Name varchar,
                      Company_Telephone varchar,
                      Company_Email varchar,
                      Password varchar,
                      Username varchar
                      )')
        connection = PG.connect(dbname: 'clients')
        connection.exec('CREATE TABLE product_values (
                        Product_ID SERIAL PRIMARY KEY,
                        Product_Name varchar,
                        gross_sale_cost int,
                        distribution_price int
                        )')
  end
end
DatabaseCreator.create_database
DatabaseCreator.create_tables
