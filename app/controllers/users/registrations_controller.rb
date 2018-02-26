# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json, :only => [:create]

  def create
    super do |user|
      @auth_token = Tiddle.create_and_return_token(user, request) if resource.persisted?
    end
  end

end
