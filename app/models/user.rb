class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  include ActiveModel::SecurePassword
  has_secure_password

  validates :login, presence: true, uniqueness: true
  validates_presence_of :region, if: proc {|u| !u.admin?}

  validates_presence_of :firstname, if: proc {|u| !u.admin?}
  validates_presence_of :lastname, if: proc {|u| !u.admin?}
  validates_presence_of :prename, if: proc {|u| !u.admin?}



  validates :password, presence: true
  validates :password_confirmation, presence: true
end
