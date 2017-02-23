*Build: 

	bundle install

*Build MySQL Database: (rake command: $ rake -T)
	
	rake db:create_migration NAME=db_models # create an ActiveRecord migration in ./db/migrate
	
	rake db:migrate # migrate your database

*Run App:
	
	rackup

Goodluck!!!

Copyright by Hawking