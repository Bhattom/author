class Book < ApplicationRecord
  belongs_to :author, dependent: :destroy
  has_many :lineitems
  has_many :orders, through: :lineitems
end
