class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image, :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description, length: { maximum: 1000 }
    with_options numericality: { other_than: 0 } do
      validates :category_id, :status_id, :shipping_charge_id,
                :prefecture_id, :days_to_ship_id
    end
  end
end
