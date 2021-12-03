require 'open-uri'
class StocksController < ApplicationController
skip_before_action :authenticate_user!, only: %i[index]
before_action :set_stock, only: %i[show]

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def search

    @stock = Stock.where(symbol: params[:query].upcase).first
    if @stock
      redirect_to @stock
    else
      redirect_to request.referer, notice: "Stock not found!"
    end
  end


  private

  def stock_params
    params.require(:stock).permit(:name, :symbol)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
