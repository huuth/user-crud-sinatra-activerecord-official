class ReviewController < ApplicationController
	
	get '/review' do
		redirect to('/review/show')
	end

	get '/review/new' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		haml :new_review
	end

	post '/review/new' do
		if session[:user_id] == nil
			redirect to('/login') 
		end
		@book = BookReview.new(params[:book_review])
		@book[:user_id] = session[:user_id]
		@book.save
		redirect to('/review/show')
	end

	get '/review/show' do
		@reviews = BookReview.where("user_id = ?", session[:user_id])
		haml :show_review
	end

	get '/review/update' do
		@review = BookReview.find(params[:id].to_i)
		haml :review_update
	end

	post '/review/update' do
		BookReview.update(params[:id].to_i, :subject => params[:subject],
											:content => params[:content],
											:star => params[:star])
		redirect to('/review/show')
	end

	get '/review/delete' do
		BookReview.delete(params[:id])
		redirect to('/review/show')
	end


end