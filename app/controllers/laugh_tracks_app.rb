
require 'pry'
class LaughTracksApp < Sinatra::Base

  get '/' do
    @comedians = Comedian.all
    erb :"comedians/index"
  end

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where age: params[:age]
      @specials = Special.where(comedian_id: @comedians.pluck(:id))
      @average_age = params[:age]
      @average_runtime = @specials.average_runtime
    else
      @specials = Special.all
      @comedians = Comedian.all
      @average_age = Comedian.average_age
      @average_runtime = Special.average_runtime
    end
    erb :"comedians/index"
  end

end
