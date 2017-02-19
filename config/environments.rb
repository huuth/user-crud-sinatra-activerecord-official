#These Settings Establish the Proper Database Connection for Heroku Postgres
#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
#This is automatically configured on Heroku, you only need to worry if you also
#want to run your app locally

require "./config/initializers/abstract_mysql2_adapter"

configure :production, :development do
	ActiveRecord::Base.establish_connection(  
	adapter: "mysql2",
    encoding: "utf8",
    database: "sinatra_assignment",
    username: "root",
    password: "sa123456"
	)  
end

