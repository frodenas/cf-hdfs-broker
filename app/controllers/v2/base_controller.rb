class V2::BaseController < ApplicationController
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Settings.auth_username && password == Settings.auth_password
    end
  end
end
