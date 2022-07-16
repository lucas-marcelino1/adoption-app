class PetCare < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :cpf, format: {with: /(\A\d{3}\.\d{3}\.\d{3}\-\d{2}\z)|(\A\d{11}\z)/}
  validates :name, :city, presence: true
end
