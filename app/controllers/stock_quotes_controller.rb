class StockQuotesController < ApplicationController
  def index
    require 'yahoo_finance'
    @stock_data = YahooFinance.quotes(['YHOO', 'ORCL'],[:ask, :bid, :low, :high])
  end

  def show
  end

end
