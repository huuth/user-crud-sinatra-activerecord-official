class CreateModels < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
	    t.string  :first_name
	    t.string  :last_name
	    t.string  :email
	    t.string  :password
	    t.string  :avatar	
	    t.string  :about_me
	    t.integer :status
	    t.timestamps
  	end

  	create_table :books do |t|
	    t.string  :title
	    t.belongs_to :user, index: true
	    t.string  :publisher
	    t.integer  :year
	    t.timestamps
	end

	create_table :book_reviews do |t|
	    t.integer  :star
	    t.belongs_to :user, index: true
	    t.string  :subject
	    t.string  :content
	    t.timestamps
	end

	create_table :uids do |t|
	    t.string :uid
	    t.integer :user_id
	    t.timestamps
	end

  end
end
