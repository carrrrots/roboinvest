require 'open-uri'

class Stock < ApplicationRecord

   def refresh
    stocks = {}
    url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{self.symbol}&apikey=#{ENV['ALPHA_API_KEY']}"
    stock_serialized = URI.open(url).read
    stock = JSON.parse(stock_serialized)
    stocks[symbol] = {} if stocks[symbol].nil?
    stocks[symbol]["BookValue"] = stock["BookValue"]
    stocks[symbol]["Country"] = stock["Country"]
    stocks[symbol]["Exchange"] = stock["Exchange"]
    stocks
  end

end
