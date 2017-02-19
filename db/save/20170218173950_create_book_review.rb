class CreateBookReview < ActiveRecord::Migration[5.0]
  def change
  	create_table :book_reviews do |t|
	    t.string  :star
	    t.string  :reviewer
	    t.string  :subject
	    t.string  :content
	end
  end
end
