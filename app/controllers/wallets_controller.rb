class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wallet, only: %i[show destroy]

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
    @wallet = Wallet.find(params[:id])
    @wallet_stock = WalletStock.new
  end

   def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    if @wallet.save
      redirect_to wallet_path(@wallet)
    else
      render :new
    end
  end

  def destroy
    @wallet.destroy
    redirect_to wallets_path
  end

private

  def wallet_params
    params.require(:wallet).permit(:name, :invested_money)
  end

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
