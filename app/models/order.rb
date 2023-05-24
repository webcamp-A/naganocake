class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  validates :payment_method,presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
