class Order < ApplicationRecord
  has_many :lineitems
  has_many :books, through: :lineitems

  attr_accessor :bname
end
