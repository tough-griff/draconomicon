class HomeController < ApplicationController
  def index
  end

  def catchall
    flash[:notice] = "Sorry, we could not find the page you were looking for."
    redirect_to :root
  end
end
