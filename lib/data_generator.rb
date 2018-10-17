require 'pg'

class DataGenerator

  @company_name = [],
  @company_telephone = [],
  @company_representitive = [],
  @company_email = [],
  @company_address = [],
  @contract_start = [],
  @contract_end = []



  def self.create_table_data
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
                      'Monoprix',
                      '1234',
                      'sarah',
                      'dan@dan.com',
                      'this road',
                      '2018',
                      '2019');")
  end
end

DataGenerator.create_table_data
