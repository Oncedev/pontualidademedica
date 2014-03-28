class Medico < ActiveRecord::Base
  validates :CRM, presence: true, uniqueness: true
  validates :nome, presence: true
  has_many :consultas
end
