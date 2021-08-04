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

  def role_to_enum (role)
    case role
      when "client" then return 0
      when "employee" then return 1
      when "manager" then return 2
      when "admin" then return 3
      else
        return -1
    end
  end

  def upgrade_to(status)
    digit = role_to_enum(status)
    p status
    if(digit < 0)
        return 0
      else
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
        p self.update(role: digit)
        p self
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
        p "////////////////|||||||||\\\\\\\\\\\\\\\\"
    end
  end

  def bind_shop(shop)
    self.update(shop: shop)
  end

  
  ###
  # integrer la notion de scopes et de privileges
  ##
  #
end