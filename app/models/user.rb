class User < ApplicationRecord
	has_many :shortened_urls
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   after_create :assign_role

   def assign_role 
   	self.role_id = Role.last.id
   end

end
