class DepoisDaMarcacaoValidator < ActiveModel::EachValidator
  def validate_each(consulta, attr, value)
    consulta[attr].nil? ||
    consulta.hora_marcacao.nil? ||
    unless consulta[attr] >= consulta.hora_marcacao
      consulta.errors[attr] <<
        "não deve ser anterior à hora de marcação"
    end
  end
end

class NaoFuturaValidator < ActiveModel::EachValidator
  def validate_each(consulta, attr, value)
    unless value.is_a?(Date)? value <= Date.today : false
      consulta.errors[attr] << "está no futuro"
    end
  end 
end

class Consulta < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :medico
  validates :usuario, presence: true
  validates :medico, presence: true
  validates :hora_marcacao, presence: true
  validates :hora_atendimento, presence: true, depois_da_marcacao: true
  validates :data_consulta, presence: true, nao_futura: true
  validates :anonimo, inclusion: { in: [true, false ] }
end
