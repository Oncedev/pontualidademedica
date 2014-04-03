class CopyNomeToNomePesquisavel < ActiveRecord::Migration
  def change
    Medico.all do |m|
      m[:nome_pesquisavel] = I18n.transliterate m.nome
      m.save
    end
  end
end
