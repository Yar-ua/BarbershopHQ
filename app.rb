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


get '/' do
# => сортировка списка в обратном порядке
	@barbers = Barber.order "created_at DESC"
# => вывести весь список по порядку
#	@barbers = Barber.all
	erb :index
end