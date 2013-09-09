class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :intercept_html_requests

  layout nil

  private

  def intercept_html_requests
    render('layouts/dynamic') if request.format == Mime::HTML
  end
end
