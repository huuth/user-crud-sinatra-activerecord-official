class UserController < ApplicationController

	get '/register' do
		haml :register
	end

	post '/register' do
		filename = params[:avatar][:filename]
		file =	 params[:avatar][:tempfile]
		File.open(File.join(settings.upload_dir, filename), 'wb') do |f|
			f.write(file.read)
		end
		params[:user][:avatar] = filename
		params[:user][:status] = 0
		@user = User.new(params[:user])
		@user.save

		@user.sendEmailVerify(@user[:id])
		session[:user_id] = @user[:id]
		redirect to('/show')
	end

	get '/login' do
		haml :login
	end

	post '/auth' do
		if user = User.authenticate(params[:user])
		    session[:user_id] = user.id
		    session[:user] = user
			redirect '/show'
	  	else
	    	redirect '/login'
  		end
	end

	get '/verify' do
		uid = Uid.where("uid = ?", params[:uid])
		if uid[0]
			User.update(uid[0][:user_id], :status => 1)
			Uid.delete(uid[0][:id])
			redirect to('/show')
		end
	end

	get '/new' do
		haml :new_user
	end

	post '/new' do
		filename = params[:avatar][:filename]
		file =	 params[:avatar][:tempfile]
		File.open(File.join(settings.upload_dir, filename), 'wb') do |f|
			f.write(file.read)
		end
		params[:user][:avatar] = filename
		@user = User.new(params[:user])
		@user.save
		redirect to('/show')
	end

	get '/show' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		@user = User.find(session[:user_id])
		# @user[:email].to_s
		haml :show_user
	end

	get '/update' do
		@user = User.find(params[:id].to_i)
		haml :update
	end

	post '/update' do
		User.update(params[:id].to_i,   :first_name => params[:first_name],
										:last_name => params[:last_name],
										:email => params[:email],
										:password => params[:password],
										:about_me => params[:about_me])
		redirect to('./show')
	end

	post '/upload_image' do
		filename = params[:file][:filename]
		file =	 params[:file][:tempfile]
		File.open(File.join(settings.upload_dir, filename), 'wb') do |f|
			f.write(file.read)
		end

		User.update(params[:id], :avatar => filename)
	end

	get '/delete' do
		User.delete(params[:id].to_i)
	end

	get '/search' do
		@users = User.where("first_name LIKE (?)", "%#{params[:keyword]}%")
		haml :index
	end
end

# UserController.run!