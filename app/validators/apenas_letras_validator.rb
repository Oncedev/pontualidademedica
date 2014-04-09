class ApenasLetrasValidator < ActiveModel::EachValidator
  def validate_each(medico, attr, val)
    unless /^[\p{L}\s]*$/ =~ val.to_s
      medico.errors[attr] << "deve conter apenas letras"
    end
  end
end
