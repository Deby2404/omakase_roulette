class Menu < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :genre

  enum food_status: {breakfast:0,lunch:1,dinner:2}

  validates :name, presence: true
  validates :introduction, presence: true
  validates :syusyoku, presence: true
  validates :syusai, presence: true
  validates :fukusai, presence: true
  validates :food_status, presence: true
  validates :genre_id, presence: true
  
end
