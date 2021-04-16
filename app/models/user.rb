class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::Allowlist

  has_many :orders

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

  ###
  # integrer la notion de scopes et de privileges
  ##
  #
  # Pas nécessaire en fait?
  # def order
  #   Order.where(user: self)
  # end
end