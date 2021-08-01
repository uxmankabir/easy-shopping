class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def cart
    @products = Product.where(id: params[:product_ids])
  end
end