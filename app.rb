require 'sinatra/base'
require './lib/company_details_retriever.rb'

class Router < Sinatra::Base
  enable :sessions

  get '/' do
    @company_sets = CompanyDetailsRetriever.get_all
    erb(:all_companies)
  end

end
