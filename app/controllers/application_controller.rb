class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :info, :warning, :danger
  before_action :basic_auth unless Rails.env.test?
  before_action :login_required

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["BASIC_AUTH_NAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def login_required
    redirect_to new_session_path unless current_user
  end
end
