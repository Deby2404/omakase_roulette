class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:menus, dependent: :destroy
  has_many :contact, dependent: :destroy

  validates :name, presence: true

  def active_for_authentication? # is_deletedがfalseならtrueを返すようにしている
    super && (is_deleted == false)
  end
end
