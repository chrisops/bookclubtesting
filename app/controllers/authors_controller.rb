class AuthorsController < ApplicationController
  before_action :authenticate_user!
  include Pundit


  def index
    @authors = Author.order(:last_name)
  end

  def show
    @author = Author.find(params[:id])
  end
end
