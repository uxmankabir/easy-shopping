class RegistrationsController < ApplicationController
  before_action :already_signed_in!, only: [:new, :create]

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if @buyer.save
      flash[:success] = "Congratulations! Your account has created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :email, :password)
  end

end