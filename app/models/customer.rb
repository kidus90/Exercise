class Customer < ApplicationRecord
  has_many :invoices

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
