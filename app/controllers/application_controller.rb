require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :xml, :json

  protect_from_forgery with: :exception
  layout ->(controller) { controller.request.xhr? ? false : 'application' }
end
