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
    @consultas = Consulta.all
  end

  # GET /consultas/1
  # GET /consultas/1.json
  def show
  end

  # GET /consultas/new
  def new
    flash[:errors] = []

    if session[:usuario].nil?
      flash[:errors] = ["Você precisa logar para adicionar uma nova consulta"]
      redirect_to controller: "usuarios", action: "login"
    else
      @consulta = Consulta.new usuario_id: session[:usuario]
    end
  end

  # GET /consultas/1/edit
  def edit
  end

  # POST /consultas
  # POST /consultas.json
  def create
    flash[:errors] = []
    par = consulta_params

    medico = Medico.find_by CRM: params[:CRM_medico].to_i
    if medico.nil?
      medico = Medico.new nome: params[:nome_medico], CRM: params[:CRM_medico].to_i
      medico_ok = medico.save
      flash[:errors] += medico.errors.full_messages
    end

    @consulta = Consulta.new(
      usuario_id: session[:usuario].id,
      medico_id: medico.nil? ? nil : medico.id,
      anonimo: par[:anonimo].to_bool,
      hora_marcacao: DateTime.parse(par["hora_marcacao"]),
      hora_atendimento: DateTime.parse(par["hora_atendimento"])
    )

    respond_to do |format|
      if @consulta.save
        flash[:notice] = "Consulta adicionada"
        format.html { redirect_to controller: "medicos" }
        format.json { render action: 'show', status: :created, location: @consulta }
      else
        flash.now[:errors] += @consulta.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultas/1
  # PATCH/PUT /consultas/1.json
  def update
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

  # DELETE /consultas/1
  # DELETE /consultas/1.json
  def destroy
    @consulta.destroy
    respond_to do |format|
      format.html { redirect_to consultas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta
      @consulta = Consulta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consulta_params
      params.require(:consulta).permit(:medico_id, :usuario_id, :hora_marcacao, :hora_atendimento, :anonimo)
    end
end
