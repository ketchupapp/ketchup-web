class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :do_not_set_cookie, if: -> { request.format.json? }
  before_action :authenticate_user!

  private

  # Do not generate a session or session ID cookie
  # See https://github.com/rack/rack/blob/master/lib/rack/session/abstract/id.rb#L171
  def do_not_set_cookie
    request.session_options[:skip] = true
  end
end
