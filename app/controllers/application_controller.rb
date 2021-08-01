class ApplicationController < ActionController::Base

  helper_method :current_buyer
  helper_method :buyer_signed_in?

  def current_buyer
    @current_buyer ||= Buyer.find_by_id(session[:buyer_id])
  end

  def buyer_signed_in?
    current_buyer.present?
  end

  def authenticate_buyer!
    unless buyer_signed_in?
      flash[:warning] = "Please login to perform this action."
      redirect_to new_session_path
    end
  end

  def already_signed_in!
    if buyer_signed_in?
      flash[:warning] = "You have logged in already."
      redirect_to root_path
    end
  end

end
