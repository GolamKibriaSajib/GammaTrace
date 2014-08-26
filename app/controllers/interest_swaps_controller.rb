class InterestSwapsController < ApplicationController
before_action :authenticate_user!
layout 'trace';

  def index
    @searches = current_user.searches.all
    @user = current_user
    @fixedfloatswaps = InterestSwap.irfixedfloat.search(params[:search]).sort_by {|x| x.execution_timestamp}
    @searchId = params[:searchId]
  end

  private


end
