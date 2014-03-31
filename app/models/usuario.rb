class Usuario < ActiveRecord::Base
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :senha, presence: true
  has_many :consultas
end
