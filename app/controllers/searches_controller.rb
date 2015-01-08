class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search, only: [:show, :show_timeseries, :show_termstructure, :show_datatable, :show_delta, :show_ois, :show_ccy, :edit, :update, :destroy]
  # before_action :authenticate_user!
  # GET /searches
  # GET /searches.json
  def index
    @searches = current_user.searches.all
    @views = current_user.views.all

    respond_to do |format|
      format.js
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  def show_timeseries
    searcher
  end

  def show_termstructure
    searcher
  end

  def show_datatable
    searcher
  end

  def show_details
    searcher
  end

  def show_delta
    searcher
  end

  def show_ois
    searcher
  end

  def show_ccy
    searcher
  end

  def showchart
  end

  # GET /searches/new
  def new
    @search = Search.new
    respond_to do |format|
      format.js 
    end
  end

  # GET /searches/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /searches
  # POST /searches.json
  def create
    @searches = current_user.searches.all
    @search = Search.new(search_params)
    @search.user = current_user
    respond_to do |format|
      if @search.save
        format.html
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.require(:search).permit(:name, :taxonomy, :cleared, :indication_of_collateralization, :indication_of_end_user_exception, :execution_venue, :effective_date, :end_date, :settlement_currency, :notional_currency_1, :notional_currency_2, :rounded_notional_amount_1, :rounded_notional_amount_2, :option_strike_price, :option_type, :option_premium, :option_expiration_date, :floating_leg_reset)
  end

  def searcher
    @scopedsearch = @search.scopingsearch.sort_by {|x| x.execution_timestamp}
    @scopedsearch = @scopedsearch.reject {|i|  i.common_fixed_fair_rate == nil} 
    respond_to do |format|
      if @scopedsearch.length == 0
        format.js { render "searches/show_nodata" }
      else
        format.js
      end
    end
  end

end
