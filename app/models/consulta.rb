class Consulta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :medico
  validates :usuario, presence: true
  validates :medico, presence: true
  validates :hora_marcacao, presence: true
  validates :hora_atendimento, presence: true
  validates :data_consulta, presence: true
  validates :anonimo, inclusion: { in: [true, false ] }
end
