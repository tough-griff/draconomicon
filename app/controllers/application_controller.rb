class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Application-wide catch-all redirect
  def catchall
    flash[:notice] = t(".flashes.redirect")
    redirect_to :root
  end
end
