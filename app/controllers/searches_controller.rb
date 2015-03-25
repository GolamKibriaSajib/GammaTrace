class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search, only: [:show, :show_chart, :edit, :update, :destroy, :chart_updater]

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

  def show_chart
    graphType = "show_".concat(params[:graph_type])
    @bodyidentifier = params[:bodyid]
    gon.searchName = "FA"
    @searchid = @search.id
    @scopedsearch = @search.scopingsearch
    @scopedsearch = @scopedsearch.reject {|i|  i.common_fixed_fair_rate == nil}
    if graphType == "show_termstructure"
      termstructure_data
    elsif graphType == "show_datatable"
      datatable_data
    elsif graphType == "show_delta"
      delta_data
    else
      @scopedsearch = @scopedsearch.sort_by {|x| x.execution_timestamp}
      @scopedsearch = @scopedsearch.map {|a| {x:((a.execution_timestamp)*1000), y:a.common_fixed_fair_rate, dissId: a.dissemination_id}}.to_json
    end
    respond_to do |format|
      if @scopedsearch.length == 0
        format.js { render "searches/show_nodata" }
      else
        format.js { render "searches/#{graphType}"}
      end
    end
  end

  def timeseries_data
    @scopedsearch = @scopedsearch.sort_by {|x| x.execution_timestamp}
    # @scopedsearch = @scopedsearch.map {|a| {x:((a.execution_timestamp)*1000), y:a.common_fixed_fair_rate, dissId: a.dissemination_id}}.to_json
  end

  def data_preprocessor
  end

  def termstructure_data
    @scopedsearch1 = @scopedsearch.sort_by {|x| x.execution_timestamp}
    @scopedsearch2 = @scopedsearch.sort_by {|x| x.end_date}
    @scopedsearch_a = @scopedsearch1.map {|a| {x:((a.execution_timestamp)*1000), y:a.common_fixed_fair_rate, dissId: a.dissemination_id, topdata: (((a.end_date - Date.today.to_time.to_i)*1000)/(31556926.0*1000.0))}}.to_json
    @scopedsearch_alter = @scopedsearch2.map {|a| {x:(((a.end_date - Date.today.to_time.to_i)*1000)/(31556926.0*1000.0)), y:a.common_fixed_fair_rate, dissId: a.dissemination_id, execution_timestamp: ((a.execution_timestamp)*1000)}}
    @scopedsearch_b = @scopedsearch_alter.to_json
    Rails.logger.info "XXXX>>>#{@scopedsearch_alter.length}<<<XXXX"
  end

  def datatable_data
    @scopedsearch = @scopedsearch.sort_by {|x| x.execution_timestamp}
    Rails.logger.info ">>>>>>>>>>>>>> #{@scopedsearch.first.fixed_delta} <<<<<<<<<<"
    Rails.logger.info ">>>>>>>>>>>>>> #{@scopedsearch.second.fixed_delta} <<<<<<<<<<"
  end

  def vega_data
  end

  def delta_data
    @scopedsearch = @scopedsearch.sort_by {|x| x.execution_timestamp}
    detailparser
  end

  def detailparser
    @deltahasharray =  {"periods" => [], "curveDeltas" => []}
    @scopedsearch.each do |item|
      fixed_delta = JSON.parse(item.fixed_delta)
      @deltahasharray["periods"] = @deltahasharray["periods"] | fixed_delta["periods"]
      fixed_delta["curveDeltas"].each do |hashmaker|
        newhash = {}
        newhash["name"] = hashmaker["name"]
        newhash["quoteInstrumentTypes"] = hashmaker["quoteInstrumentTypes"]
        newhash["deltaValues"] = hashmaker["deltaValues"]
        if @deltahasharray["curveDeltas"].count > 0 
          @deltahasharray["curveDeltas"].each do |iter|
            if iter.has_key?("name")
              if iter["name"] == newhash["name"]
                iter["deltaValues"] = [iter["deltaValues"], newhash["deltaValues"]].transpose.map{|a| a.sum}
              end
            end
          end
        else 
          @deltahasharray["curveDeltas"].push(newhash)
        end

      end
      
    end
      Rails.logger.info("#{@deltahasharray["periods"]}")
      Rails.logger.info("#{@deltahasharray["curveDeltas"]}")
  end


  def chart_updater
    @data_set = JSON.parse(params[:data_set]);
    min_execution_timestamp = (params[:min]).to_f;
    max_execution_timestamp = (params[:max]).to_f;
    @body_id = params[:body_id]
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>> #{@data_set.first}"
    @modifiedseta = @data_set.delete_if {|x| ((x["execution_timestamp"] < min_execution_timestamp) || (x["execution_timestamp"]  > max_execution_timestamp))}
    @modifiedset = @modifiedseta.to_json
    Rails.logger.info ">>>>>#{@modifiedseta.length}<<<<<"
    respond_to do |format|
      format.js
    end
  end


  # GET /searches/new
  def new
    @search = current_user.searches.new
    respond_to do |format|
      format.js 
    end
  end


  def edit
    respond_to do |format|
      format.js
    end
  end


  def create
    @searches = current_user.searches.all
    @search = current_user.searches.new(search_params)
    respond_to do |format|
      if @search.save
        format.html
        format.js
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @search.update(search_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @search.destroy
    respond_to do |format|
      format.js
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

end
