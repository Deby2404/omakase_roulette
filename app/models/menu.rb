class Menu < ApplicationRecord
  has_one_attached :image
  belongs_to :customer

  enum food_status: {breakfast:0,lunch:1,dinner:2}
end
