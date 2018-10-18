require 'sinatra/base'
require './lib/company_details_retriever.rb'
require './lib/all_orders_summary.rb'

class Router < Sinatra::Base
  enable :sessions

  get '/' do
    @company_sets = CompanyDetailsRetriever.get_all
    erb(:all_companies)
  end

  get '/order_summary' do
    @order_summaries = AllOrdersSummary.get_all
    erb(:all_order_summaries)
  end

end
