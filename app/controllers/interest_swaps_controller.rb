class InterestSwapsController < ApplicationController
before_action :authenticate_user!, only: [:index]
layout 'trace', only: [:index]


  def home
  end


  def index
    @searches = current_user.searches.all
    @user = current_user
    @fixedfloatswaps = InterestSwap.irfixedfloat.search(params[:search]).sort_by {|x| x.execution_timestamp}
    @searchId = params[:searchId]
    @views = current_user.views.all
  end



  private


end
