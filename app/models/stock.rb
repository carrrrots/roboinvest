require 'open-uri'

class Stock < ApplicationRecord

   def refresh
    my_stock = {}
    url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{self.symbol}&apikey=#{ENV['ALPHA_API_KEY']}"
    stock_serialized = URI.open(url).read
    stock = JSON.parse(stock_serialized)
    my_stock[symbol] = {} if my_stock[symbol].nil?
    my_stock[symbol]["description"] = stock["Description"]
    my_stock[symbol]["exchange"] = stock["Exchange"]
    my_stock[symbol]["country"] = stock["Country"]
    my_stock[symbol]["sector"] = stock["Sector"]
    my_stock[symbol]["industry"] = stock["Industry"]
    my_stock[symbol]["market_capitalization"] = stock["MarketCapitalization"]
    my_stock[symbol]["bookvalue"] = stock["BookValue"]
    my_stock[symbol]["dividend_per_share"] = stock["DividendPerShare"]
    my_stock[symbol]["dividend_yield"] = stock["DividendYield"]
    my_stock[symbol]["profit_margin"] = stock["ProfitMargin"]
    my_stock[symbol]["analyst_target_price"] = stock["AnalystTargetPrice"]
    my_stock
  end
end
