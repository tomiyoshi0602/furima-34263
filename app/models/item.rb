class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options numericality: { other_than: 1 }
  validates :category_id, :status_id, :shipping_charge_id, 
            :prefecture_id, :days_to_ship_id 
end
