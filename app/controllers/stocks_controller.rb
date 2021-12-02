require 'open-uri'

class StocksController < ApplicationController
before_action :set_stock, only: %i[show]

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :symbol)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
