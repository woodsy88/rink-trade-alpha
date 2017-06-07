class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end


#class WelcomeController < ApplicationController
  # Turn off user authentication for all actions in this controller
 # skip_before_filter :authenticate_user!

 # def index
    #'...'
#  end


#end