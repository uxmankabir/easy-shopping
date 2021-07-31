class SessionsController < ApplicationController
  before_action :authenticate_buyer!, only: [:destroy]
  before_action :already_signed_in!, only: [:new, :create]

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.find_by_email(params[:buyer][:email])
    if @buyer.present? && @buyer.authenticate(params[:buyer][:password]).present?
      session[:buyer_id] = @buyer.id
      flash[:success] = "You have siggned in successfully."
      redirect_to root_path
    else
      flash[:danger] = "Your email or password is incorrect."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:buyer_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to new_session_path
  end

end