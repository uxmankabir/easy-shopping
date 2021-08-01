class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validate :avaiable_quantity

  after_create :set_price
  after_create :update_quantity

  def avaiable_quantity
    unless self.product.quantity > 0
      errors.add(:product, "stock for #{self.product.name} has finished.")
    end
  end

  def set_price
    self.update(price: self.product.price)
  end

  def update_quantity
    quantity = self.product.quantity
    self.product.update(quantity: quantity-1)
  end

end