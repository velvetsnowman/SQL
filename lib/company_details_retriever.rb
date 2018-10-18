require 'pg'

class CompanyDetailsRetriever

  def initialize(name,telephone,representitive,email,address,start_date,end_date)
    @name = name
    @telephone = telephone
    @representitive = representitive
    @email = email
    @address = addres
    @start_date = start
    @end_date = end_date

  end

  def self.get_all
    connection = PG.connect(dbname: 'clients')
    result = connection.exec("SELECT * from client_details")
    result.map { |row| CompanyDetailsRetriever.new(row['company_id'],
                                          row['company_name'],
                                          row['company_telephone'],
                                          row['company_representitive'],
                                          row['company_email'],
                                          row['company_address'],
                                          row['company_contract_start_date'],
                                          row['company_contract_end_date'])}

  end

end

CompanyDetailsRetriever.get_all
