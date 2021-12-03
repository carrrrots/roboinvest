class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wallet, only: %i[show]

  def index
    @wallets = Wallet.all
  end

  def filter_wallets
    p params
    @wallets = Wallet.all
    if params[:name].present?
      sql_name = "name ILIKE :name"
      @wallets = Wallet.where(sql_name, name: "%#{params[:name]}%")
    end
    if params[:limit].present?
      @wallets= Wallet.limit(params[:limit])
    end
    respond_to do |format|
      format.json { render json: @wallets}
    end
  end

  def show
  end

private

  def wallet_params
    params.require(:wallet).permit(:name, :money, :invested_money, :profit)
  end

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
