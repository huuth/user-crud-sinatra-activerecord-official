require 'sinatra/base'

require_relative 'controllers/application_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/book_controller'
require_relative 'controllers/review_controller'

use UserController
use BookController
use ReviewController
run ApplicationController

# run ApplicationController
