class Guest::GuestController < ApplicationController

  def index
  end

  def login
    render 'guest/login'
  end

end
