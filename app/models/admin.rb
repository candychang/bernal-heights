class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :registerable, :validatable
  validates :name, presence: true
  
  def is_superadmin?
    return self.admin
  end
end
