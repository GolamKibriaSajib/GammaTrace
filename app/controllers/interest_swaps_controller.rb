class InterestSwapsController < ApplicationController
before_action :authenticate_user!, only: [:index]
layout 'trace', only: [:index]


  def home
  end


  def index
    @user = current_user
    @searches = @user.searches.all
    @views = current_user.views.all
  end



  private


end
