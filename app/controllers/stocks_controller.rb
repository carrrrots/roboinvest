require 'open-uri'
class StocksController < ApplicationController
skip_before_action :authenticate_user!, only: %i[index]
before_action :set_stock, only: %i[show]

  def index
    @stocks = Stock.all
  end

  def show; end

private

  def stock_params
    params.require(:stock).permit(:name, :symbol)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
