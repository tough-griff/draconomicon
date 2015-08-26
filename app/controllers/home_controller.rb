class HomeController < ApplicationController
  def about
  end

  def index
  end

  def style_test
    flash[:error] = "Some error string! Oh no!"
    flash[:alert] = "An alert message. Please be careful!"
    flash[:success] = "Hooray! A success."
    flash[:notice] = "Some information pertaining to something goes here."
  end
end
