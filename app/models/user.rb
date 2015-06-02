class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registrations
  has_many :events, :through => :registrations
  has_many :groups, :through => :registrations
  belongs_to :program
  belongs_to :section
  belongs_to :kwest

end
