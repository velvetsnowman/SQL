require 'pg'

class Company
  attr_reader :id,:name,:telephone,:representitive,:email,:address,:start_date,:end_date

  def initialize(name,telephone,representitive,email,address,start_date,end_date,id=nil)
    @id = id
    @name = name
    @telephone = telephone
    @representitive = representitive
    @email = email
    @address = address
    @start_date = start_date
    @end_date = end_date
  end

  def self.get_all
    connection = PG.connect(dbname: 'clients')
    result = connection.exec("SELECT * from client_details
                              ORDER BY company_name ASC")
    result.map { |row| Company.new(row['company_name'],
                                          row['company_telephone'],
                                          row['company_representitive'],
                                          row['company_email'],
                                          row['company_address'],
                                          row['company_contract_start_date'],
                                          row['company_contract_end_date'],
                                          row['company_id'])}

  end

  def self.add_company(name,telephone,representitive,email,address,start_date,end_date)
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
                      '#{name}',
                      '#{telephone}',
                      '#{representitive}',
                      '#{email}',
                      '#{address}',
                      '#{start_date}',
                      '#{end_date}');")
  end

end
