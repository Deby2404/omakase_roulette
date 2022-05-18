class Contact < ApplicationRecord
  belongs_to :customer

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
