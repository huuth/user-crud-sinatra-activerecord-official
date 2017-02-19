class BookController < ApplicationController
	
	get '/book' do
		redirect to('/book/show')
	end

	get '/book/new' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		@user = User.find(session[:user_id])
		haml :new_book
	end

	post '/book/new' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		@book = Book.new(params[:book])
		@book[:user_id] = session[:user_id]
		@book.save
		redirect to('/book/show')
	end

	get '/book/show' do
		@books = Book.where("user_id = ?", session[:user_id])
		haml :show_book
	end

	get '/book/update' do
		@book = Book.find(params[:id].to_i)
		haml :book_update
	end

	post '/book/update' do
		Book.update(params[:id].to_i,   :title => params[:title],
										:publisher => params[:publisher],
										:year => params[:year])
		redirect to('/book/show')
	end

	get '/book/delete' do
		Book.delete(params[:id])
		redirect to('/book/show')
	end

end