class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to friends_path
    else
      redirect_to about_path
    end
  end

  def about
  end
end
