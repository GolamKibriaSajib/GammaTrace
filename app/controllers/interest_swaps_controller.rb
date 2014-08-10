class InterestSwapsController < ApplicationController


  def index
    a = InterestSwap.find(:all, :conditions => { :taxonomy => 'InterestRate:IRSwap:FixedFloat'})
    @fixedfloatswaps = a.find(:all, :conditions => [ :action => 'NEW'])
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Time Series")
      f.subtitle(:text => "Click and drag in the plot area to zoom in. Pinch the chart to zoom in")
      f.xAxis(:type => "datetime", :floor => "2014")
      f.series(:data => @fixedfloatswaps.map {|x| [((x.execution_timestamp)*1000), x.price_notation]})
      f.tooltip(:valueSuffix => "%")
      f.yAxis [
        {:title => {:text => "Price Notation in %", :margin => 1}}
      ]

      # f.legend(:align => 'right', :verticalAlign => 'top', :y => 5, :x => -10, :layout => 'vertical',)
      f.chart({:type =>"line", :zoomType => 'xy', :animation => true})
    end

  end
end
