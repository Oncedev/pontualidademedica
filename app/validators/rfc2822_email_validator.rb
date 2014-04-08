class Rfc2822EmailValidator < ActiveModel::EachValidator
  def validate_each(medico, attr, val)
    unless valid_email(val)
      medico.errors[attr] << "não está em um formato válido"
    end
  end

  private
  def valid_email( value )
    begin
      return false if value == ''
      parsed = Mail::Address.new( value )
      return parsed.address == value && parsed.local != parsed.address
    rescue Mail::Field::ParseError
      return false
    end
  end
end
