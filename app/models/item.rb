class Item < ApplicationRecord
  #validates is_active, inclusion: [true, false]
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def with_tax_price
    (price * 1.1).floor
  end
end
