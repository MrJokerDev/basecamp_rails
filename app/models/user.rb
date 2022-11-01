class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin, :manager]
  
  after_initialize :default_role, :if => :new_record?

  def default_role
    self.role ||= :user
  end

  
end
