class Usuario < ActiveRecord::Base
  validates :nome, presence: true, apenas_letras: true
  validates :email, presence: true, uniqueness: true, rfc2822_email: true
  validates :senha, presence: true
  has_many :consultas
end
