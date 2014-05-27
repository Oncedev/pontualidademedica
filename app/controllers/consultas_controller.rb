# http://jeffgardner.org/2011/08/04/rails-string-to-boolean-method/
class String
  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

class ConsultasController < ApplicationController
  before_action :set_consulta, only: [:show, :edit, :update, :destroy]

  # GET /consultas
  # GET /consultas.json
  def index
    if true # session[:usuario].nil?
      render "public/404.html", status: :not_found
    else
      @consultas = Consulta.where usuario_id: session[:usuario].id
    end
  end

  # GET /consultas/1
  # GET /consultas/1.json
  def show
    if true # session[:usuario].nil? || @consulta.usuario_id != session[:usuario].id
      render "public/404.html", status: :not_found
    end
  end

  # GET /consultas/new
  def new
    if session[:usuario].nil?
      redirect_to controller: "usuarios", action: "login", redir: "nova_consulta"
    else
      @consulta = Consulta.new usuario_id: session[:usuario]
      @medico = Medico.new
    end
  end

  # GET /consultas/1/edit
  def edit
  end

  # POST /consultas
  # POST /consultas.json
  def create
    if session[:usuario].nil?
      render "public/500.html", status: :internal_server_error
    else
      par = consulta_params

      @medico = Medico.new(
        CRM: params[:CRM_medico],
        nome: params[:nome_medico],
        estado_id: params[:estado_medico]
      )
      if !medico_created = @medico.save
        m = Medico.find_by CRM: params[:CRM_medico], estado_id: params[:estado_medico]
        if !m.nil?
          @medico = m
          medico_created = false
        end
      end

      hora_marcacao = par[:hora_marcacao]
      hora_marcacao = "2400" if hora_marcacao == "24:00"
      hora_atendimento = par[:hora_atendimento]
      hora_atendimento = "2400" if hora_atendimento == "24:00"

      @consulta = Consulta.new(
        usuario_id: session[:usuario].id,
        medico_id: @medico.nil? ? nil : @medico.id,
        anonimo: par[:anonimo].to_s.to_bool,
        hora_marcacao: hora_marcacao,
        hora_atendimento: hora_atendimento,
        data_consulta: par[:data_consulta],
        observacoes: par[:observacoes]
      )

      respond_to do |format|
        if @consulta.save && @medico.valid?
          flash[:notice] = "Consulta registrada"
          format.html { redirect_to controller: "medicos" }
          format.json { render action: 'show', status: :created, location: @consulta }
        else
          @consulta.errors.messages.delete :medico
          @medico.delete if medico_created
          format.html { render action: 'new' }
          format.json { render json: @consulta.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /consultas/1
  # PATCH/PUT /consultas/1.json
  def update
    if true # Não atualizar consultas por enquanto
      render "public/500.html", status: :internal_server_error
    else
      respond_to do |format|
        if @consulta.update(consulta_params)
          format.html { redirect_to @consulta, notice: 'Consulta was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @consulta.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /consultas/1
  # DELETE /consultas/1.json
  def destroy
    if true # Não excluir consultas por enquanto
      render "public/500.html", status: :internal_server_error
    else
      @consulta.destroy
      respond_to do |format|
        format.html { redirect_to consultas_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta
      @consulta = Consulta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consulta_params
      params.require(:consulta).permit(
        :medico_id,
        :usuario_id,
        :hora_marcacao,
        :hora_atendimento,
        :data_consulta,
        :anonimo,
        :observacoes)
    end
end
