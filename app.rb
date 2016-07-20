#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# => создание подключения к базе данных
set :database, "SQLite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do

# => вывести весь список по порядку
	@barbers = Barber.all
	erb :index
end

# => ------------------------------
get '/visit' do
	erb :visit
	end

post '/visit' do

# => my way
#	@username = params[:username]
#	@phone = params[:phone]
#	@datetime = params[:datetime]
#	@barber = params[:barber]
#	@color = params[:color]
#
#	Client.create(:name => @username,
#					:phone => @phone,
#					:date_stamp => @datetime,
#					:barber => @barber,
#					:color => @color)
#
#--------------------------------

	c = Client.new params[:client]
	c.save
	
	erb "<h3>Спасибо, Вы записались</h3>"
end