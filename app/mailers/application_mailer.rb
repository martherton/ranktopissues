class ApplicationMailer < ActionMailer::Base
  default from: "info@globalmarketfactors.com"
  layout 'mailer'
   before_filter :add_inline_attachments!

  
  
	 helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views
end
