class WalletsController < ApplicationController
  def index
  end

  def new
    @wallet = Wallet.new
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def edit
  end

  def update
  end
end

private

def wallet_params
  params.require(:wallet)
end
