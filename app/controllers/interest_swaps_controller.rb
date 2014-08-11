class InterestSwapsController < ApplicationController


  def index
    @fixedfloatswaps = InterestSwap.search(params[:search]).sort_by {|x| x.execution_timestamp}
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Time Series")
      f.subtitle(:text => "Click and drag in the plot area to zoom in. Pinch the chart to zoom in")
      f.xAxis(:gridLineWidth => 0,:type => "datetime", :floor => "2014")
      f.series(:color => "red", :data => @fixedfloatswaps.map {|x| [((x.execution_timestamp)*1000), x.price_notation, x.dissemination_id]})
      f.tooltip(crosshairs: [true,true],:valueSuffix => "%")
      f.yAxis(:gridLineWidth => 0,:type => "linear",:title => {:text => "Price Notation in %"})
      f.rangeSelector(:selected => 1)
      # f.legend(:align => 'right', :verticalAlign => 'top', :y => 5, :x => -10, :layout => 'vertical',)
      f.chart({:type =>"spline", :zoomType => 'xy', :animation => true})
    end

    @fixedfloatswaps2 = InterestSwap.where('taxonomy = ? AND execution_timestamp > ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 345600)).sort_by {|x| x.execution_timestamp}
    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Scatter Plot")
      f.subtitle(:text => "Click and drag in the plot area to zoom in. Pinch the chart to zoom in")
      f.xAxis(:gridLineWidth=> 0, :type => "linear", :floor => 0, :title => {:text=>"(END_DATE - today) in years"})
      f.series(:color => "red",:data => @fixedfloatswaps2.map {|x| [((((x.end_date)- Time.now.to_i)/ 31556926)), x.price_notation]})
      f.tooltip(:valueSuffix => "%")
      f.yAxis [
        {:title => {:text => "Price Notation in %", :margin => 1}, }
      ]
      f.rangeSelector(:selected => 1)

      # f.legend(:align => 'right', :verticalAlign => 'top', :y => 5, :x => -10, :layout => 'vertical',)
      f.chart({:type =>"scatter", :zoomType => 'xy', :animation => true})
    end

  end

end
