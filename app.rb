require 'sinatra/base'
require './lib/company.rb'
require './lib/all_orders_summary.rb'

class Router < Sinatra::Base
  enable :sessions

  get '/' do
    @company_sets = Company.get_all
    erb(:all_companies)
  end

  get '/order_summary' do
    @order_summaries = AllOrdersSummary.get_all
    erb(:all_order_summaries)
  end

  get '/add_new_company' do
    erb(:form_for_new_company)
  end
  post '/add_new_company' do
    Company.add_company(params['name'],params['telephone'],params['representitive'],params['email'],params['address'],params['start'],params['end'])
    redirect '/'
  end
  

end
