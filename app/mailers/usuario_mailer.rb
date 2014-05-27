class UsuarioMailer < ActionMailer::Base
  default from: "pontualidademedica@oncedev.com"

  def recuperar_senha(usuario)
    @usuario = usuario
    mail to: @usuario.email, subject: "Sua senha do Pontualidade Médica"
  end
end
