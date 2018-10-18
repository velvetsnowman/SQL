require 'pg'

class DataGenerator

  @company_name = ['Monoprix', 'Super Z', 'A-Z', 'Carrefour', 'Asda']
  @company_telephone = ['034569810', '579456345', '568956845', '963342234', '456789653']
  @company_representitive = ['Sarah Marcial', 'Daina Mirza', 'Rebecca Cones', 'Mike Trent', 'Josh Dimario']
  @company_email = ['monoprixadmin@monoprix.com', 'superzmarket@gmail.com', 'a2z@alphabetmarket.com', 'carrefour@carrefour.com', 'asdacompany@gmail.com']
  @company_address = ['a', 'b', 'c', 'd', 'e']
  @contract_start = ['01/01/2015', '01/08/2009', '10/02/2014', '31/05/2016', '23/08/2015']
  @contract_end = ['01/01/2017', '01/08/2019', '10/02/2017', '31/05/2019', '23/08/2018']



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
      i += 1
    end
  end
end

DataGenerator.create_table_data
