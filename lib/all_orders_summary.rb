require 'pg'

class AllOrdersSummary
  attr_reader :summary_id,:company_id,:company_name,:number_of_orders,:total_revenue,:company_telephone,:company_email
  def initialize(summary_id,company_id,company_name,number_of_orders,total_revenue,company_telephone,company_email)
    @summary_id = summary_id
    @company_id = company_id
    @company_name = company_name
    @number_of_orders = number_of_orders
    @total_revenue = total_revenue
    @company_telephone = company_telephone
    @company_email = company_email
  end

  def self.get_all
    connection = PG.connect(dbname: 'clients')
    result = connection.exec("SELECT * FROM all_orders_summary")
    result.map { |row| AllOrdersSummary.new(row['summary_id'],
                                            row['company_id'],
                                            row['company_name'],
                                            row['number_of_orders'],
                                            row['total_revenue'],
                                            row['company_telephone'],
                                            row['company_email'])}
  end
end
