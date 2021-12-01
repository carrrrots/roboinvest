require 'open-uri'

class StocksController < ApplicationController
before_action :set_stock, only: %i[show]

  def index
    @stocks = open_market
  end

  def show
  end

  def open_market
    stocks = {}
    STOCKS_SYMBOLS.keys.each do |symbol|
      url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=IBM&apikey=#{ENV['ALPHA_API_KEY']}"
      stock_serialized = URI.open(url).read
      stock = JSON.parse(stock_serialized)
      stocks[symbol] = {} if stocks[symbol].nil?
      stocks[symbol]["BookValue"] = stock["BookValue"]
      stocks[symbol]["Country"] = stock["Country"]
      stocks[symbol]["Exchange"] = stock["Exchange"]
    end

    stocks
  end

private

  def stock_params
    params.require(:stock).permit(:name, :symbol)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
