class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  has_one_attached :image

  validates :image, prisence: true do
  validates :name, prisence: true do
  validates :explanation, prisence: true do
  validates :category_id, prisence: true do
  validates :item_status_id, prisence: true do
  validates :shipping_cost_id, prisence: true do
  validates :prefecture_id, prisence: true do
  validates :shipping_date_id, prisence: true do
  validates :price, prisence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do

end
