class Subcategory < ApplicationRecord

  belongs_to :category
  has_many :items
end


