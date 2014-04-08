class Medico < ActiveRecord::Base
  validates :CRM, presence: true, uniqueness: true, apenas_numeros: true
  validates :nome, presence: true, apenas_letras: true
  has_many :consultas

  def nome=(val)
    self[:nome] = val
    self[:nome_pesquisavel] = I18n.transliterate(val).downcase if !val.nil?
  end

  def atraso_medio
    consultas = Consulta.where medico_id: self.id
    atraso_total = !consultas.nil? ? consultas.inject(0) do |parcial, c|
      atraso = ((c.hora_atendimento - c.hora_marcacao) / 60).to_int

      parcial + atraso
    end : 0

    consultas.size != 0 ? atraso_total / consultas.size : 0
  end
end
