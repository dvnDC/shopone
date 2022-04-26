class WalletsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    # @wallets = Wallet.paginate(page: params[:page], :per_page => 16)
  end

  def new
    if current_user.wallet.nil?
      @wallet = Wallet.new
    else
      @wallet = Wallet.find(current_user.wallet[0].id)
      redirect_to @wallet
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
    if @wallet.update(wallet_params)
      flash[:success] = "Wallet updated!"
      redirect_to @wallet
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def create
    @wallet = current_user.wallet.build(wallet_params)
    if @wallet.save
      flash[:success] = "Wallet created!"
      redirect_to @wallet
    else
      render 'static_pages/home'
    end
  end

  def show
    @user = User.find(current_user.id)
    @wallet = Wallet.find(params[:id])
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy
    flash[:success] = "Wallet deleted!"
    redirect_to request.referrer || root_url, status: :see_other
  end

  private

  def wallet_params
    params.require(:wallet).permit(:money)
  end

  def correct_user
    @wallet = current_user.wallet.find_by(id: params[:id])
    redirect_to root_url if @wallet.nil?
  end

  def correct_wallet
    @wallet = current_user.wallet.find_by(id: params[:id])
    redirect_to root_url if @wallet.nil?
  end
end