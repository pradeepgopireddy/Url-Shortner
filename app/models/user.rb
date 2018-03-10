class User < ApplicationRecord
	belongs_to :role
	has_many :shortened_urls
	has_many :logs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   after_create :assign_role

   def assign_role 
   	self.role_id = Role.last.id
   end

end
