require 'mail'
require 'digest'


class User < ActiveRecord::Base
  	validates_uniqueness_of :email

  	def self.authenticate(params)
	    user = User.find_by_email(params[:email])
	    (user && user.password == params[:password]) ? user : nil
  	end

  	def sendEmailVerify(user_id, email)
  		obj = Hash.new
  		obj[:uid] = Digest::MD5.hexdigest rand(1000.1).to_s
  		obj[:user_id] = user_id
  		uid = Uid.new(obj)
  		uid.save

  		options = { :address      => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'localhost:9292',
            :user_name            => 'hawkingth',
            :password             => 'saobacdau359',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

		Mail.defaults do
		  delivery_method :smtp, options
		end

  		mail = Mail.new do
      to email
     	from 'hawkingth@gmail.com'
  		subject 'Verify your email!'
     	body "Click link to verify your account: http://localhost:9292/verify?uid=" + uid[:uid]
		end

		mail.deliver
  	end
end