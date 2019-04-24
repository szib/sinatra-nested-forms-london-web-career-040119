require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      pirate_data = params[:pirate]
      ships_data = pirate_data[:ships]

      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])

      ships_data.each do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
