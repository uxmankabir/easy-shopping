class OrdersController < ApplicationController
  before_action :authenticate_buyer!

  def index
    @orders = current_buyer.orders.order(created_at: :desc)
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        order = current_buyer.orders.create
        product_ids = params[:product_ids].split(" ")
        product_ids.each do |product_id|
          order.order_items.create!(product_id: product_id)
        end
        flash[:success] = "Order created successfuly."
      end
    rescue => e
      flash[:danger] = e
    end
    redirect_to root_path
  end

end