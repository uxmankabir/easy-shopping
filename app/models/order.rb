class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :buyers
end