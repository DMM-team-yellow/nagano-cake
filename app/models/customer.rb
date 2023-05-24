class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :is_deleted, inclusion: { in: [true, false] }
  #is_deletedがfalseならtrueを返す
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def full_name
    self.last_name + " " + self.first_name
  end

end
