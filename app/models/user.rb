class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :songs, dependent: :destroy

  def admin?
    self.user_type == 101
  end

  def reg_admin?
    self.user_type == 10
  end
end
