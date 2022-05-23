class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many:menus, dependent: :destroy
  has_many :contact, dependent: :destroy
  #has_many :sns, dependent: :destroy

  validates :name, presence: true

  def active_for_authentication? # is_deletedがfalseならtrueを返すようにしている
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(name:'guestuser', email:'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def self.from_omniauth(auth)
    customer = find_by(email: auth.info.email)
    if customer
      customer.update(provider: auth.provider, uid: auth.uid)
    end

    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      # deviseのuserカラムに name を追加している場合は以下のコメントアウトも追記します
      customer.name = auth.info.name
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0,20]
    end
  end
end

