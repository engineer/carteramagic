class HomeController < ApplicationController
  def index
    render 'index', :layout => 'frontend'
  end
end
