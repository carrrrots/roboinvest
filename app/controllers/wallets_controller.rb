class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show]

  def index
    @wallets = Wallet.all
  end

  def show
    @wallet = Wallet.find(params[:id])
    @wallet_stock = WalletStock.new
  end

private

  def wallet_params
    params.require(:wallet).permit(:name, :money, :invested_money, :profit)
  end

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
