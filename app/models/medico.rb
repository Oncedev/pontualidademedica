class Medico < ActiveRecord::Base
  validates :CRM, presence: true
  validates :nome, presence: true
end
