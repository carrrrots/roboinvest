class WalletStocksController < ApplicationController

  def create
    @wallet = Wallet.find(params[:wallet_id])
    @wallet_stock = WalletStock.new(wallet_stock_params)
    @wallet_stock.wallet = @wallet
    if @wallet_stock.save
      redirect_to @wallet
    else
      p @wallet_stock.errors.full_messages
    end
  end

  def destroy
    @wallet_stock = WalletStock.find(params[:id])
    @wallet_stock.destroy
    redirect_to @wallet_stock.wallet
  end

  private

  def wallet_stock_params
    params.require(:wallet_stock).permit(:investment_stock, :number_of_stock, :date, :stock_id)
  end
end
