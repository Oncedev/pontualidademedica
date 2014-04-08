class ApenasNumerosValidator < ActiveModel::EachValidator
  def validate_each(medico, attr, val)
    unless /^[0-9]*$/ =~ val.to_s
      medico.errors[attr] << "não pode conter letras"
    end
  end
end
