class UserMail < ActionMailer::Base
	default from: "requests@marketissues.com"
	

	def requestsend(request)
		
		
  	@request = request
  	@user = User.find(@request.user_id)
		mail(to: ENV["REQUEST_RECEIVER"], subject: "You have recieved a user request from #{@user.first_name} #{@user.last_name}")
	end	

	def notifysend
		mail(to: ENV["REQUEST_RECEIVER"], subject: "A new user has signed up")
	end	
end
