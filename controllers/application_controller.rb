require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/user'        #Model class
require './models/book' 
require './models/uid' 
require './models/book_review'
require 'haml'
require "bundler/setup"
class ApplicationController < Sinatra::Base

	set :views, File.expand_path('../../views', __FILE__)	
	set :public_folder, File.expand_path('../../public', __FILE__)
	set :upload_dir, File.join(settings.public_folder, 'uploads')

	enable :sessions
	before do 
		
	end

	get '/' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		# @users = User.find(session[:user_id])
		haml :show_user
	end

	

	after do
	  # Close the connection after the request is done so that we don't
	  # deplete the ActiveRecord connection pool.
	  ActiveRecord::Base.connection.close
	end

end

# ApplicationController.run!