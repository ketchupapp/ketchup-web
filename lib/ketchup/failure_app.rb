require "devise/failure_app"

class Ketchup::FailureApp < Devise::FailureApp
  def respond
    request.format.json? ? json_error : super
  end

  def json_error
    self.status = 401
    self.content_type = "application/json"

    case warden_message || :unauthenticated
    when :unauthenticated
      errors = { authentication: i18n_message }
    when :invalid
      errors = { password: i18n_message }
    when :not_found_in_database
      keys = scope_class.authentication_keys
      errors = keys.map{|k| [k, i18n_message] }.to_h
    else
      errors = { message: i18n_message }
    end

    self.response_body = { errors: errors }.to_json
  end
end
