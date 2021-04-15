class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles, dependent: :destroy
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, 
         :registerable,
         :jwt_authenticatable, 
         jwt_revocation_strategy: self

  enum role:{
    client: 0,
    employee: 1,
    manager: 2,
    admin: 3
  }
end