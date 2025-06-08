class Item < ApplicationRecord
  has_many :invoice_items

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
