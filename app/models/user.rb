class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :first_name, :last_name, :class_year, :section_id, :program_id, presence: true
    validates :class_year, numericality: { only_integer: true }
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
