# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user, if: -> { request.format.json? }
  respond_to :json, :only => [:create, :destroy]

  def create
    return super unless request.format.json?

    super do |user|
      @auth_token = Tiddle.create_and_return_token(user, request)
    end
  end

  def destroy
    return super unless request.format.json?

    if current_user && Tiddle.expire_token(current_user, request)
      head :ok
    else
      render json: { error: {"auth_token": ["invalid token"]} }, status: 401
    end
  end

end
