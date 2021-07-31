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
    redirect_to new_session_path unless buyer_signed_in?
  end

  def already_signed_in!
    redirect_to root_path if buyer_signed_in?
  end

end
