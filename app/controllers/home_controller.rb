class HomeController < ApplicationController
  before_action :authenticate_login!

  def index
    # No authentication required for the index action
  end

  def show
    # Authentication is required for the show action
  end

  private

  def authenticate_login!
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
