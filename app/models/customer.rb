class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  

  validates :is_deleted, inclusion: {in: [true, false]}
  
  
  def full_name
    last_name + ' ' + first_name
  end
  
  def address_display
    '〒' + postal_code + ' ' + address
  end
end
