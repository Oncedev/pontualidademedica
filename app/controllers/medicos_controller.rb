class MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :edit, :update, :destroy]

  # GET /medicos
  # GET /medicos.json
  def index

    crm = Integer(params[:CRM_ou_nome]) rescue nil

    @medicos = if !params.include? :CRM_ou_nome
      todos_os_medicos = true

      Medico.all
    elsif crm.nil?
      nome = I18n.transliterate params[:CRM_ou_nome]

      Medico.where("nome_pesquisavel like ?", "%#{nome}%")
    else
      Medico.where CRM: crm
    end

    numero_medicos = @medicos.clone.size # Tem que ser clonado porque o size executa a query

    if numero_medicos == 0 && todos_os_medicos
      render "nenhum_medico"
    else
      limit = Integer(params[:registros_pagina]) rescue nil
      num_pagina = Integer(params[:num_pagina]) rescue nil
      offset = !num_pagina.nil? ? limit * (num_pagina - 1) : 0

      respond_to do |format|
        format.html { limit = 10 if limit.nil? }
        format.json {}
      end

      @medicos.limit! limit if !limit.nil?
      @medicos.offset! offset if !offset.nil?
      @medicos.sort_by!(&:atraso_medio).reverse!
      @medicos.map! { |m| { medico: m, atraso_medio: m.atraso_medio } }

      limit = Float(limit.nil?? numero_medicos : limit)

      @num_paginas = if numero_medicos == 0
        0
      else
        (numero_medicos / limit).ceil
      end
    end
  end

  # GET /medicos/1
  # GET /medicos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_params
      params.require(:medico).permit(:CRM, :nome, :CRM_ou_nome, :num_pagina, :registros_pagina)
    end
end
