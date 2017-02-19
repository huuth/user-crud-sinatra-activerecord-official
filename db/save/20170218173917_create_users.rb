class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
	    t.string  :first_name
	    t.string  :last_name
	    t.string  :email
	    t.string  :password
	    t.string  :avatar	
	    t.string  :about_me	
  	end
  end
end
